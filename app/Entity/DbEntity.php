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

    public static function findOneBy(array $where)
    {
        self::getConnection()->connect();
        $select = "SELECT * FROM {$this->table}";
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
    }
}
