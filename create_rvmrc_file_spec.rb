require 'rspec'
require './sinixtro'

describe 'Create a rvmrc file' do
  let (:project_name) { 'project_name' }
  let (:sinixtro) { Sinixtro.new(project_name) }

  it 'creates the project directory ' do
    sinixtro.create_project_dir
    Dir.exist?(project_name).should be_true
  end

  it 'creates the rvmrc file' do
    sinixtro.create_project_dir
    sinixtro.create_rvmrc
    rvm_file_path = File.join(project_name, '.rvmrc') 
    File.exist?(rvm_file_path).should be_true
    File.new(rvm_file_path).read.should == "rvm 1.9.3@#{project_name} --create"
  end 

  after do
    FileUtils.rm_rf project_name
  end
end
