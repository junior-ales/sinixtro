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
end
