This is a project to practice using google proto buffer serialize/deserializing.
We have some information about `Creatives` and `Placements` in a xml file which is provided by other services.
This xml file is out main input and we have to return list of placements and their suitable creatives in protobuf
structure(simply it is a compacted string of values). How we decide if a creative is suitable for a place:
```
    if creative.price >= placement.floor
        is it suitable
    else
        it is not
    end
```

Ruby version: ruby-3.1.3

System dependencies:

- you have to install `protoc` on your machine:
    
    - Link to read more: https://grpc.io/docs/protoc-installation/
        
    - Run: `sudo apt install -y protobuf-compiler`

    - Test: `protoc --version`

    - Expected output: `libprotoc x.x.x` (my version was `libprotoc 3.0.0`)


Configuration:
    
    run `bundle install`

Database creation:
- No database yet

Database initialization:
- No database yet

How to run the test suite:
- Run: `rspec spec/`

Services (job queues, cache servers, search engines, etc.):
- Nothing yet.


Notes:

- If you added new message to protobuf messages ('userconfiguration.proto' file).

        run `rails protobuf:compile`
        run `cp ./lib/userconfiguration.pb.rb ./lib/userconfiguration.rb`
        run `rm ./lib/userconfiguration.pb.rb`

- You can read more here about ruby-protobuf -> https://github.com/ruby-protobuf/protobuf/wiki/Installation

<br>
<br>
<br>
<br>
<br>
For the main task we have 2 services (GeneratePlacementSeq, GeneratePlacement) you can use them in rails consol (run `rails c`).

`GeneratePlacementSeq.call(file_path: file_path)`

`GeneratePlacement.call(file_path: file_path, placement_id: placement_id)`

we have 2 end-points to fetch placement/s:

Get all placements in protobuff

    GET base_url/placements

Get the placement with id :placement_id in protobuff

    GET base_url/placements/:placement_id