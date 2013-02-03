class Sinixtro
  def initialize(project_name)
    @project_name = project_name
  end

  def create_project_dir
    Dir.mkdir @project_name
  end

  def create_rvmrc
    File.open(File.join(@project_name, '.rvmrc'), 'w') do |f|
      f.write("rvm 1.9.3@#{@project_name} --create")
    end
  end

  def create_configru
    File.open(File.join(@project_name, 'config.ru'), 'w') do |f|
      f.write("require './lib/controller.rb'\n")
      f.write("run Sinatra::Application")
    end
  end

  def create_controller
    lib_folder_path = File.join(@project_name, 'lib')
    Dir.mkdir(lib_folder_path)

    FileUtils.cp(File.join('.', 'templates', 'controller.rb'), lib_folder_path)
  end
end
