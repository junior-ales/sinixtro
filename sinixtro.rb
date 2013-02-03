class Sinixtro
  def initialize(project_name)
    @project_name = project_name
  end

  def create_project_dir
    Dir.mkdir @project_name
  end

  def create_rvmrc
    File.new(File.join(@project_name, '.rvmrc'), 'w').write('')
  end
end
