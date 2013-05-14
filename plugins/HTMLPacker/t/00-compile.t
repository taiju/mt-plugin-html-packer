use strict;
use warnings;
use lib 't/lib', 'lib', 'extlib';

use Test::More;

use MT;
use MT::Test;

ok(MT->component('HTMLPacker'), 'plugin load ok');

require_ok('HTMLPacker::Tags');

done_testing;
