package LOGIN::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;

any '/' => sub {
    my $c = shift;
	my $id = $c->session->get('id') // return $c->redirect('/login');
		#login now
		my $user = $c->db->single('users', {'id' => $id});
		my $xarg = {
			id => $id,
			user => $user,
		};
		return $c->render( "index.tx" => {
				xarg => $xarg,
			});
};

any '/login' => sub {
	my $c = shift;
	defined $c->session->get('id') and return $c->redirect('/');
	my $error = $c->req->param('error') // 0;
	my $xarg = {
		error => $error,
	};
	return $c->render( "login.tx" => {
			xarg => $xarg,
		});
};

post '/login_process' => sub {
	my $c = shift;
	if (my $user = $c->db->single('users', {'id' => $c->req->param('id')})){
		if($c->req->param('secret') eq $user->pass){
			$c->session->set(id => $user->id);
			return $c->redirect('/');
		}	
	}
	return $c->redirect('/login', +{error => 1});
};

any '/logout' => sub {
    my $c = shift;
    $c->session->expire();
    return $c->redirect('/');
};

1;
