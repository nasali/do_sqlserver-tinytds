# Apache Buildr buildfile for do_sqlserver
# see http://incubator.apache.org/buildr/ for more information on Apache Buildr
require 'buildr'
require 'pathname'

VERSION_NUMBER = '1.0'
JDBC_SUPPORT = ['data_objects:jdbc:jar:1.0']
TARGET_DIR = 'pkg/classes'
repositories.remote << 'http://www.ibiblio.org/maven2/'

define 'do_sqlserver' do
  project.version = VERSION_NUMBER
  project.group = 'data_objects.rb'

  manifest['Copyright'] = 'Raimonds Simanovskis (C) 2009'

  compile.using :target => '1.5', :lint => 'all', :deprecation => 'true'

  define 'ext-java' do
    package(:jar).clean.include(TARGET_DIR)
        
    jdbc_support_jar = file('../../do_jdbc/lib/do_jdbc_internal.jar')
    jdbc_support = artifact('data_objects:jdbc:jar:1.0').from(jdbc_support_jar)
    
    compile.into(TARGET_DIR).with(JDBC_SUPPORT)
  end
end
