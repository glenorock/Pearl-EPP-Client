use lib 'E:\STAGE ANTIC\code\Pearl-EPP-Client\lib';
use EPP::Domain;

my $contact = {
    'id' => 'testContactID',
    'postalInfo' => {
        'int' => {
            'name' => 'John Doe',
            'org' => 'Example Inc.',
            'addr' => {
                'street' => [
                    '123 Example Dr.',
                    'Suite 100'
                ],
                'city' => 'Dulles',
                'sp' => 'VA',
                'pc' => '20116-6503',
                'cc' => 'US',
            }
        }
    },
    'clID' => 'test',
    'status' => [
        'linked',
        'serverDeleteProhibited'
    ],
    'voice' => '+1.7035555555x1234',
    'fax' => '+1.7035555556',
    'email' => 'jdoe@example.com',
};

EPP::Domain::check("example.text")