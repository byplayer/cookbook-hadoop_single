name             'hadoop_single'
maintainer       'byplayer'
maintainer_email 'byplayer100@gmail.com'
license          'All rights reserved'
description      'Installs/Configures cookbook-hadoop_single'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(java).each do |cookbook|
  depends cookbook
end
