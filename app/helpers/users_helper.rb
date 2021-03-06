module UsersHelper
	def uglify_email_helper(email)
		temp = inject_some_rand_lyllies(email)
		temp.join
	end

	private
	def inject_some_rand_lyllies temp
		rand = Random.new
		temp = temp.split('')
		count = [1, rand.rand(temp.length / 2)].max
		count.times {temp.insert(rand.rand(temp.length), " \u269C ")}
		temp
	end
end
