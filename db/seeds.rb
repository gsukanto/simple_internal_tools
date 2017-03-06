User.create(email: 'gregory.sukanto@btpn.com', password: 'sudahlupa')
Role.create(name: 'admin')
Role.create(name: 'sms')
User.find_by_email('gregory.sukanto@btpn.com').add_role('admin')