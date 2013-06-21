# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Administrator.create(email: "admin@admin.com", password: "12345678", password_confirmation: "12345678") unless Administrator.find_by_email "admin@admin.com"
# device = Device.create(serial_number: "100089", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100090", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.052", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100091", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "70.02", latitude: "12.01")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100092", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "71.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100093", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100094", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100095", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100096", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100097", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100098", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100099", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100100", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100101", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100102", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100103", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100104", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100105", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100106", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100107", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04")
# collected_measurement.save(:validate => false)
# device = Device.create(serial_number: "100108", token: "1q2w3e4r5t")
# collected_measurement = CollectedMeasurement.new(device_id: device.id, longitude: "77.02", latitude: "12.04
#   collected_measurement.save(:validate => false)")

# traced_route = Device.find_by_serial_number("111111").traced_routes.new(:description => "Cargo de Uvas", :start_datetime => Time.now)
# collected_measurement = CollectedMeasurement.new(device_id: 22, longitude: "77.02", latitude: "12.04", traced_route_id: 1)
# collected_measurement.save(:validate => false) 

# collected_measurement = CollectedMeasurement.new(device_id: 22, longitude: "78.02", latitude: "12.11", traced_route_id: 1)
# collected_measurement.save(:validate => false) 

# collected_measurement = CollectedMeasurement.new(device_id: 22, longitude: "79.02", latitude: "13.04", traced_route_id: 1)
# collected_measurement.save(:validate => false) 

# collected_measurement = CollectedMeasurement.new(device_id: 22, longitude: "80.02", latitude: "13.34", traced_route_id: 1)
# collected_measurement.save(:validate => false) 

# collected_measurement = CollectedMeasurement.new(device_id: 22, longitude: "80.82", latitude: "13.44", traced_route_id: 1)
# collected_measurement.save(:validate => false) 

# collected_measurement = CollectedMeasurement.new(device_id: 22, longitude: "81.02", latitude: "14.04", traced_route_id: 1)
# collected_measurement.save(:validate => false) 

# collected_measurement = CollectedMeasurement.new(device_id: 22, longitude: "81.52", latitude: "14.14", traced_route_id: 1)
# collected_measurement.save(:validate => false) 

# collected_measurement = CollectedMeasurement.new(device_id: 22, longitude: "82.32", latitude: "14.24", traced_route_id: 1)
# collected_measurement.save(:validate => false) 

# collected_measurement = CollectedMeasurement.new(device_id: 22, longitude: "82.92", latitude: "14.94", traced_route_id: 1)
# collected_measurement.save(:validate => false) 






