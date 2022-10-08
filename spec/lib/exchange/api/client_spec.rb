RSpec.describe Exchange::Api::Client do
  let(:client) { described_class.new }

  specify '#get_info' do
    WebMock.allow_net_connect!
    body = {"args"=>{},
            "headers"=>{"Accept"=>["*/*"],
                        "Accept-Encoding"=>["gzip;q=1.0,deflate;q=0.6,identity;q=0.3"],
                        "Content-Type"=>["application/json"],
                        "Fly-Client-Ip"=>["213.138.82.210"],
                        "Fly-Forwarded-Port"=>["80"],
                        "Fly-Forwarded-Proto"=>["http"],
                        "Fly-Forwarded-Ssl"=>["off"],
                        "Fly-Region"=>["fra"],
                        "Fly-Request-Id"=>["01GEWK5699M2Y6ZHQYCSAJGZMB-fra"],
                        "Fly-Traceparent"=>["00-5a4703caaf31a03c0ce580b7643744ab-8906b9e9b139c4a2-00"],
                        "Fly-Tracestate"=>[""], "Host"=>["httpbingo.org"],
                        "User-Agent"=>["Faraday v2.6.0"],
                        "Via"=>["1.1 fly.io"],
                        "X-Forwarded-For"=>["213.138.82.210, 77.83.142.42"],
                        "X-Forwarded-Port"=>["80"],
                        "X-Forwarded-Proto"=>["http"],
                        "X-Forwarded-Ssl"=>["off"],
                        "X-Request-Start"=>["t=1665259444521923"]},
            "origin"=>"213.138.82.210",
            "url"=>"http://httpbingo.org/get"}.to_json

    stub_request(:get, "http://httpbingo.org/get")
      .to_return(status: 200, body: body, headers: {})

    client.get_info

    expect(WebMock).to have_requested(:get, "http://httpbingo.org/get")
  end

  specify '#post_info' do
    # TODO
  end
end