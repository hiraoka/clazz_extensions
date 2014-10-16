require "clazz_extensions"

describe "ClazzExtensions::Array" do
  before do
    @array = ClazzExtensions::Array.new
  end

  it "duplication" do
    #[1,2,3,1].duplication
    expect( @array.duplication( [1,2,3,1], nil ) ).to eq( [1] )
    #[1,2,3,1,3].duplication
    array = [1,2,3,1,3]
    expect( @array.duplication( array    , nil ) ).to eq( [1,3] )
    expect( array ).to eq( [1,2,3,1,3] )
  end

  it "blank?" do
    #[].blank?
    expect( @array.blank?( []     , nil ) ).to eq( true )
    #[1,2,3].blank?
    expect( @array.blank?( [1,2,3], nil ) ).to eq( false )
  end

  it "duplication!" do
    #[1,2,3,1].duplication!
    array = [1,2,3,1]
    @array.duplication!( array, nil )
    expect( array ).to eq( [1] )
    #[1,2,3,1,3].duplication!
    array = [1,2,3,1,3]
    @array.duplication!( array, nil )
    expect( array ).to eq( [1,3] )
  end

  it "unduplication" do
    #[1,2,3,1].unduplication
    expect( @array.unduplication( [1,2,3,1], nil ) ).to eq( [2,3] )
    #[1,2,3,1,3].unduplication
    array = [1,2,3,1,3]
    expect( @array.unduplication( array    , nil ) ).to eq( [2] )
    expect( array ).to eq( [1,2,3,1,3] )
  end
end
