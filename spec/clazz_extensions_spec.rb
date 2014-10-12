require "clazz_extensions"

describe "ClazzExtensions" do
  describe "load method" do
    before do
      ClazzExtension.load do
        string :reject_all
      end
    end

    it "not include all methods at String class" do
      ClazzExtension.load do
        string :all
      end
      ClazzExtension.load do
        string :reject_all
      end

      included_module = String.included_modules.index(Extension::String)
      expect( included_module                      ).not_to be( nil )
      expect( String.method_defined?( :classify )  ).to     be( false )
      expect( String.method_defined?( :classify2 ) ).to     be( false )
      expect( String.method_defined?( :to_const )  ).to     be( false )
    end

    it "include Extensions::String at String class" do
      ClazzExtension.load do
        string :all
      end

      included_module = String.included_modules.index(Extension::String)
      expect( included_module ).not_to be( nil )
    end

    it "included only specific mehtod at String class" do
      ClazzExtension.load do
        string add: [:classify]
      end

      included_module = String.included_modules.index(Extension::String)
      expect( included_module                     ).not_to be( nil )
      expect( String.method_defined?( :classify ) ).to     be( true )
    end

    it "not included specific mehtod at String class" do
      ClazzExtension.load do
        string reject: [:classify]
      end

      included_module = String.included_modules.index(Extension::String)
      expect( included_module                     ).not_to be( nil )
      expect( String.method_defined?( :classify ) ).to     be( false )
    end

    it "included all mehtod at String class" do
      ClazzExtension.load do
        string :all
      end

      included_module = String.included_modules.index(Extension::String)
      expect( included_module                      ).not_to be( nil )
      expect( String.method_defined?( :classify )  ).to     be( true )
      expect( String.method_defined?( :to_const )  ).to     be( true )
      expect( String.method_defined?( :classify2 ) ).to     be( true )
    end
  end
end
