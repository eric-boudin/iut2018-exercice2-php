<?php
declare(strict_types=1);

namespace Tests\Entity;

use Tests\TestCase;
use App\Entity\CustomerAddress;
use App\Entity\Customer;

final class CustomerAddressTest extends TestCase
{
    public function testCanRetrieveCustomer(): void
    {
        $customerAddress = CustomerAddress::findOneBy(1);
        $customer = $customerAddress->customer();

        $this->assertInstanceOf(
            Customer::class,
            $customer
        );
    }
}
