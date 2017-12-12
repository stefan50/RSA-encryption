class RSA
	def initialize n,e,d
		@n = n
		@e = e
		@d = d
	end
private
	def is_prime? a
		state = true
		for i in 2...a
			if a%i == 0
				state = false
			end 
		end
		state
	end

	def generate_rand
		seed = Random.new_seed 
		while true
			a = Random.new.rand(1..1000)
			if is_prime? a then break
			end
		end	
		a
	end
public

	def new_key
		p = generate_rand
		q = generate_rand

		@n = p*q
		lambda_n = (p-1).lcm(q-1)
		while true
			@e = generate_rand
			if @e < lambda_n and lambda_n % @e != 0 
				break
			end
		end
		for d in 1..lambda_n
			if (d*@e)%lambda_n == 1
				@d = d
				break
			end
		end
	end

	def set_e 
		@e = 0
	end

	def set_d 
		@d = 0
	end

	def n
		@n 
	end

	def e
		@e
	end

	def d
		@d
	end

	def encrypt message
		encrypted_message = Array.new
		message.bytes.each do |byte|
			byte = ((byte**@e)% @n)
			encrypted_message.push(byte)
			encrypted_message.push("f")
		end
		encrypted_message = encrypted_message.join
		encrypted_message 
	end

	def decrypt message 
		decrypted_message = String.new
		message = message.split("f")
		message = message.map {|e| e.to_i}
		message.each do |element|
			element = (element**@d) % @n
			decrypted_message << element.chr
		end
		decrypted_message 
	end
end
