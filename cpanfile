requires "Browsermob::Proxy" => "0";
requires "Cwd" => "0";
requires "Exporter" => "0";
requires "File::Basename" => "0";
requires "File::Spec" => "0";
requires "Honeydew::Config" => "0";
requires "Honeydew::ExternalServices" => "0";
requires "Honeydew::ExternalServices::Crontab" => "0";
requires "feature" => "0";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "Test::Spec" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "Pod::Coverage::TrustPod" => "0";
  requires "Test::Pod" => "1.41";
  requires "Test::Pod::Coverage" => "1.08";
};
