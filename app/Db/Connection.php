<?php
namespace App\Db;

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
        if ($this->pdo !== null) {
            return;
        }
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

    public function escape($value)
    {
        return $this->pdo->quote($value);
    }

    /**
     *
     * @return array|null
     */
    public function fetchRow(string $select, int $fetchStyle = PDO::FETCH_ASSOC)
    {
        $stmt = $this->pdo->query($select);
        return $stmt->fetch($fetchStyle);
    }

    public function __destruct()
    {
        try {
            $this->disconnect();
        } finally {
        }
    }
}
