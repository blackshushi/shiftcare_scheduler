task :install_seed_data => [:environment] do
    Rake::Task['try_install_admins'].invoke
	Rake::Task['try_install_clients'].invoke
	Rake::Task['try_install_plumbers'].invoke
    Rake::Task['try_install_events'].invoke
end

task :try_install_admins => [:environment] do 
    if Admin.count != 0
        next
    end

    Admin.create!(name: 'admin', email: 'admin@gmail.com', password: 'testtest')
end

task :try_install_clients => [:environment] do 
    if Client.count != 0
        next
    end

    Client.create!(name: 'Ali', age: 45, address: 'Kuala Lumpur')
    Client.create!(name: 'Ahmad', age: 23, address: 'Johor Bahru', private_note: 'I am a royal client!')
    Client.create!(name: 'Mary', age: 21, address: 'Ipoh', private_note: 'Hi')
    Client.create!(name: 'tester1', age: 30, address: 'Kuala Lumpur', private_note: 'I am tester in this company')
    Client.create!(name: 'Daymond', age: 31, address: 'Singapore', private_note: "What's happening in Malaysia?")
    Client.create!(name: 'Tracy', age: 25, address: 'Puchong')
end

task :try_install_plumbers => [:environment] do 
    if Plumber.count != 0
        next
    end

    Plumber.create!(name: 'Mohammad', address: 'Kuala Lumpur', vehicles: ['Proton Saga'])
    Plumber.create!(name: 'Alex', address: 'Johor Bahru', vehicles: ['Proton X50'])
    Plumber.create!(name: 'Raymond', address: 'Puchong', vehicles: ['Honda City', 'Perodua Myvi'])
    Plumber.create!(name: 'Uncle Lim', address: 'Kuala Lumpur', vehicles: ['Proton Saga', 'Perodua Axia'])
    Plumber.create!(name: 'tester1', address: 'Kuala Lumpur', vehicles: ['Proton X70'])
    Plumber.create!(name: 'Flun', address: 'Ipoh', vehicles: ['Toyota Vios'])
end

task :try_install_events => [:environment] do 
    if Event.count != 0
        next
    end

    10.times do |i|
        time = Time.zone.at(rand * Time.now.to_i)
        Event.create!(client: Client.all.sample, plumbers: Plumber.all.sample(rand(1..Plumber.count)), start_date: time, end_date: time + 5.days)
    end
end
