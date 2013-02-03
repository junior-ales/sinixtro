require 'rspec'
require './sinixtro'

describe 'Create a rvmrc file' do
  let (:project_name) { 'project_name' }

  it 'creates the project directory ' do
    Sinixtro.new(project_name).create_project_dir
    Dir.exist?(project_name).should be_true
  end

  it 'creates the rvmrc file' do
    sinixtro = Sinixtro.new(project_name)
    sinixtro.create_project_dir
    sinixtro.create_rvmrc
    File.exist?(File.join(project_name, '.rvmrc')).should be_true
  end 

  after do
    FileUtils.rm_rf project_name
  end
end
