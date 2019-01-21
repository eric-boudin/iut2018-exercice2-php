<?php
namespace Entity;

use Config;
use Db\Connection;

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
