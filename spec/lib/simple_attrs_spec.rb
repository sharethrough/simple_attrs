require 'spec_helper'

describe SimpleAttrs do
  context 'setting an attribute' do
    let(:klass) { Class.new { include SimpleAttrs } }

    it 'defines a reader' do
      klass.has_simple_attr(:valid_attr)
      instance = klass.new
      expect(instance).to respond_to("valid_attr")
    end

    it 'defines a writer' do
      klass.has_simple_attr(:valid_attr)
      instance = klass.new
      expect(instance).to respond_to("valid_attr=")
    end
  end

  context '#intialize' do
    let(:klass) { Class.new { include SimpleAttrs } }
    let(:klass_with_custom_initialize) do
      Class.new {
        include SimpleAttrs
        has_simple_attr :valid_attr
        def initialize(some_value)
          @some_value = some_value
        end
      }
    end

    it 'defines an instance variable' do
      klass.has_simple_attr(:valid_attr)
      instance = klass.new(valid_attr: 3)
      expect(instance).to be_instance_variable_defined(:@valid_attr)
    end

    it 'sets the value of the attribute' do
      klass.has_simple_attr(:valid_attr)
      instance = klass.new(valid_attr: 3)
      expect(instance.valid_attr).to eq(3)
    end

    it 'raises error when trying to initialize non simple attr' do
      klass.has_simple_attr(:valid_attr)
      expect {
        klass.new(valid_attr: 3, invalid_attr: 4)
      }.to raise_error(ArgumentError, "Cannot set invalid_attr through initializer")
    end

    it 'allows for initialize to be overwritten' do
      expect {
        klass_with_custom_initialize.new(3)
      }.not_to raise_error
    end

    it 'allows for initialize to be overwritten' do
      expect {
        klass_with_custom_initialize.new(3)
      }.not_to raise_error
    end
  end

  describe '#attributes' do
    let(:klass) do
      Class.new {
        include SimpleAttrs
        attr_accessor :some_other_attr
      }
    end

    it 'returns all simple_attr attributes' do
      klass.has_simple_attr(:valid_attr1)
      klass.has_simple_attr(:valid_attr2)

      instance = klass.new(valid_attr1: 'test')
      expect(instance.attributes).to eq({valid_attr1: 'test', valid_attr2: nil})
    end
  end
end
