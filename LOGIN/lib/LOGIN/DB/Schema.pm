package LOGIN::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'LOGIN::DB::Row';

table {
    name 'users';
    pk 'id';
    columns qw(id pass);
};

1;
