module ActionDispatch::Routing
  describe Mapper do
    describe "#mount_ponytail" do
      let(:mapper) do
        dummy = Class.new { def resources_path_names; end }
        Mapper.new(dummy.new)
      end

      it "should receive resources" do
        mapper.should_receive(:resources) { |*args, &block| block.call }
        mapper.should_receive(:collection) { |*args, &block| block.call }
        mapper.should_receive(:get).twice
        mapper.mount_ponytail
      end
    end
  end
end
