require_relative './spec_helper.rb'
require_relative '../lib/parser.rb'

describe Parser do
  it 'Throws an error if instantiated with an invalid file path' do
    expect { Parser.new('fake_file.log') }.to raise_error(StandardError)
  end

  it 'Instantiates with a valid file path' do
    expect(Parser.new('webserver.log')).to be_truthy
  end
end
