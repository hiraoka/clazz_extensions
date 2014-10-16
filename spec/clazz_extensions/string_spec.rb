require "clazz_extensions"

describe "ClazzExtensions::String" do
  before do
    @string = ClazzExtensions::String.new
  end
  it "classify" do
    # "hoge".classify
    expect( @string.classify( "hoge"   , nil ) ).to eq( "Hoge" )
    # "foo_bar".classify
    expect( @string.classify( "foo_bar", nil ) ).to eq( "FooBar" )
    # "foo/bar".classify
    expect( @string.classify( "foo/bar", nil ) ).to eq( "Foo::Bar" )
  end

  it "blank?" do
    # "".blank?
    expect( @string.blank?( ""       , nil ) ).to eq( true )
    # "foo_bar".blank?
    expect( @string.blank?( "foo_bar", nil ) ).to eq( false )
  end

  it "to_const" do
    # "".to_const
    expect( @string.to_const( ""       , nil ) ).to eq( nil )
    # "foo_bar".to_const
    expect( @string.to_const( "foo_bar", nil ) ).to eq( nil )
    # "array".to_const
    expect( @string.to_const( "array"  , nil ) ).to eq( Array )
    # "Array".to_const
    expect( @string.to_const( "Array"  , nil ) ).to eq( Array )
  end

  it "classify2" do
    # "hoge".classify2( "hoge" )
    expect( @string.classify2( "hoge"   , ["hoge"] ) ).to         eq( "HogeHoge" )
    # "hoge".classify2( "hoge", "hoge" )
    expect( @string.classify2( "hoge"   , ["hoge", "hoge"] ) ).to eq( "HogeHogeHoge" )
  end

  it "each" do
    #array = []
    #"hoge".each do |c|
    #  array << c.succ
    #end
    array = []
    @string.each( "hoge", nil ) do |c|
      array << c.succ
    end
    expect( array ).to         eq( ["i","p", "h", "f"  ] )
  end

  it "each_with_index" do
    #hash = {}
    #"hoge".each do |c|
    #  hash[i] = c
    #end
    hash = {}
    @string.each_with_index( "hoge", nil ) do |c,i|
      hash[i] = c
    end
    expect( hash ).to         eq( {0 => "h", 1 => "o", 2 => "g", 3 => "e"} )
  end
end

