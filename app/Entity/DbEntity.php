<?php
namespace App\Entity;

use App\Config;
use App\Db\Connection;

trait DbEntity
{
    /**
     *
     * @return Connection
     */
    private static function getConnection() : Connection
    {
        return Config::getConfig('db_connection');
    }

    public static function findBy(array $where)
    {
    }

    public function save()
    {
        $data = $this->toArray();
        $table = static::$table;
        if (!$table) {
            throw new \RuntimeException('Specify table property in ' . get_class($this) . '.');
        }
        self::getConnection()->connect();

        $primaryKey = static::$primaryKey;
        $keys = array_keys($data);
        $values = array_map(function ($data) {
            if (is_int($data)) {
                return $data;
            } elseif ($data === null) {
                return 'NULL';
            } else {
                return self::getConnection()->escape($data);
            }
        }, $data);

        if (!$this->{static::$primaryKey}) {
            $query = sprintf("INSERT INTO %s (%s) VALUES (%s);", $table, implode(', ', $keys), implode(', ', $values));
            $row = self::getConnection()->execute($query);
            return (bool) $row;
        } else {
            $keyvalue = array_combine($keys, $values);
            $sets = [];
            foreach ($keyvalue as $key => $value) {
                if ($key === $primaryKey) {
                    continue;
                }
                $sets[] = "{$key} = {$value}";
            }
            $sets = implode(', ', $sets);
            $where = "{$primaryKey} = {$this->{$primaryKey}}";

            $query = sprintf("UPDATE %s SET %s WHERE %s;", $table, $sets, $where);
            $row = self::getConnection()->execute($query);
            return (bool) $row;
        }
    }

    public static function findOneBy($where)
    {
        $table = static::$table;
        if (!$table) {
            throw new \RuntimeException('Specify table property in ' . get_class($this) . '.');
        }
        self::getConnection()->connect();
        $select = "SELECT * FROM {$table}";

        if (!is_array($where)) {
            $where = [static::$primaryKey => $where];
        }

        if (!empty($where)) {
            $select .= " WHERE ";
            $wheres = [];
            foreach ($where as $col => $cond) {
                $cond = self::getConnection()->escape($cond);
                $wheres[] = "{$col} = {$cond}";
            }
            $select .= implode(' AND ', $wheres);
        }
        $row = self::getConnection()->fetchRow($select);
        if (!empty($row)) {
            $object = new static;
            foreach ($row as $key => $value) {
                $object->$key = $value;
            }
            return $object;
        }
    }

    public function belongsTo(string $entity, string $foreignKey)
    {
        /** @var Entity $entityObject */
        $entityObject = new $entity;
        if (!$entityObject instanceof Entity) {
            throw \RuntimeException("{$entity} is not an Entity.");
        }
        return $entityObject::findOneBy([$entityObject::$primaryKey, $this->{$foreignKey}]);
    }
}
