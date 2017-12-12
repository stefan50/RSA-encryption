require "RSA"

RSpec.describe RSA do
	describe ".encrypt and .decrypt"
		some_obj = RSA.new(3233,17,413) #wikipedia example
		context "encryption of numbers" do
			it "checks if it encrypts 2" do
				expect(some_obj.encrypt("2")).to eq "538f"
			end
			it "checks if it encrypts \"test\"" do
				expect(some_obj.encrypt("test")).to eq "884f1313f1230f884f"
			end
			it "checks if it encrypts \"Hello, world!\"" do
				expect(some_obj.encrypt("Hello, world!")).to eq 							"3000f1313f745f745f2185f678f1992f1107f2185f2412f745f1773f1853f"
			end
			it "checks if it encrypts \"ruby\"" do
				expect(some_obj.encrypt("ruby")).to eq "2412f2160f2570f487f"
			end
			it "checks if it encrypts \"basheva\"" do
				expect(some_obj.encrypt("basheva")).to eq "2570f1632f1230f2170f1313f2578f1632f"
			end
		end
		context "decryption of numbers" do
			it "checks if it decrypts to 2" do
				expect(some_obj.decrypt("538f")).to eq "2"
			end	
			it "checks if it decrypts to \"test\"" do
				expect(some_obj.decrypt("884f1313f1230f884f")).to eq "test"
			end
			it "checks if it decrypts to \"Hello, world!\"" do
				expect(some_obj.decrypt("3000f1313f745f745f2185f678f1992f1107f2185f2412f745f1773f1853f")).to eq "Hello, world!"
			end
			it "checks if it decrypts to \"ruby\"" do
				expect(some_obj.decrypt("2412f2160f2570f487f")).to eq "ruby"
			end
			it "checks if it decrypts to \"basheva\"" do
				expect(some_obj.decrypt("2570f1632f1230f2170f1313f2578f1632f")).to eq "basheva"
			end
		end
		context ".encrypt and .decrypt using .new_key" do
			it "checks if it encrypts and decrypts 2" do
				some_obj.new_key
				expect(some_obj.decrypt(some_obj.encrypt("2"))).to eq "2"
			end
			it "checks if it encrypts and decrypts \"test\"" do
				some_obj.new_key
				expect(some_obj.decrypt(some_obj.encrypt("test"))).to eq "test"
			end
			it "checks if it encrypts and decrypts \"Hello, world!\"" do
				some_obj.new_key
				expect(some_obj.decrypt(some_obj.encrypt("Hello, world!"))).to eq "Hello, world!"
			end
			it "checks if encrypts and decrypts \"ruby\"" do
				some_obj.new_key
				expect(some_obj.decrypt(some_obj.encrypt("ruby"))).to eq "ruby"
			end
			it "checks if encrypts and decrypts \"basheva\"" do
				some_obj.new_key
				expect(some_obj.decrypt(some_obj.encrypt("basheva"))).to eq "basheva"
			end
		end
		context "getters" do
			other_obj = RSA.new(5,4,2)
			it "checks if n == 5" do
				expect(other_obj.n).to eq 5 
			end
			it "checks if e == 4" do
				expect(other_obj.e).to eq 4 
			end
			it "checks if d == 2" do
				expect(other_obj.d).to eq 2 
			end
		end
end
