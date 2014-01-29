use strict;
use warnings;
use Test::More;


use LOGIN;
use LOGIN::Web;
use LOGIN::Web::View;
use LOGIN::Web::ViewFunctions;

use LOGIN::DB::Schema;
use LOGIN::Web::Dispatcher;


pass "All modules can load.";

done_testing;
