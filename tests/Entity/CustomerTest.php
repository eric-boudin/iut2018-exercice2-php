<?php
declare(strict_types=1);

namespace Tests\Entity;

use Tests\TestCase;
use App\Entity\Customer;

final class CustomerTest extends TestCase
{
    public function testCanSaveCustomer(): void
    {
        $customer = Customer::findOneBy(1);
        $customer->updated_at = (new \DateTime)->format('Y-m-d H:i:s');
        $result = $customer->save();
        $this->assertNotFalse($result);
    }
}
