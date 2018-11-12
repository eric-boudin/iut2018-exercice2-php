<?php
namespace Db;

use PDO;

class Connection
{
    private $configs;

    /**
     * @var PDO
     */
    private $pdo;

    public function __construct(array $configs)
    {
        $this->configs = $configs;
    }

    public function connect()
    {
        $db = $this->configs['database'] ?? false;
        $host = $this->configs['hostname'] ?? false;
        $port = $this->configs['port'] ?? false;
        $username = $this->configs['username'] ?? false;
        $password = $this->configs['password'] ?? false;
        $charset = $this->configs['charset'] ?? false;
        $this->pdo = new PDO("mysql:dbname={$db};host={$host};port={$port};charset={$charset}", $username, $password);
    }

    public function disconnect()
    {
        if (!$this->pdo instanceof PDO) {
            return;
        }
        unset($this->pdo);
    }

    public function __destruct()
    {
        try {
            $this->disconnect();
        } finally {
        }
    }
}
