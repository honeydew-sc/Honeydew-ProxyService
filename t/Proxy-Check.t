use strict;
use warnings;
use Test::Spec;
use Honeydew::Config;
use Honeydew::ProxyService;

eval { Honeydew::ProxyService::_get_bmp_binary(); };
if ($@) {
    plan skip_all => 'Author tests are not required for installation';
}

describe 'Proxy restart' => sub {
    it 'should find an actual file for the bmp binary' => sub {
        my $binary = Honeydew::ProxyService::_get_bmp_binary();
        ok( -e $binary && -x $binary);
    };

    describe 'execution command' => sub {
        my ($cmd);
        my $config = Honeydew::Config->instance( file => __FILE__ );
        $config->{proxy}->{proxy_server_port} = 8080;

        before each => sub {
            $cmd = Honeydew::ProxyService::_get_bmp_start_command();
        };

        it 'should set the javacmd env var first' => sub {
            like( $cmd, qr/JAVACMD=[^ ]+.*bin\/browsermob/ );
        };

        it 'should set the path' => sub {
            like( $cmd, qr/PATH=[^ ]+\$PATH.*bin\/browsermob/ );
        };

        it 'should use littleproxy' => sub {
            like( $cmd, qr/--use-littleproxy true/ );
        };

        it 'should specify the port from the config' => sub {
            like( $cmd, qr/--port=8080/ );
        };
    };
};

runtests;
