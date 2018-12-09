{application,tapuma,
             [{applications,[kernel,stdlib,elixir,logger,runtime_tools,
                             mssqlex,mssql_ecto,gettext,phoenix_pubsub,cowboy,
                             postgrex,phoenix,plug_cowboy,phoenix_ecto]},
              {description,"tapuma"},
              {modules,['Elixir.Tapuma','Elixir.Tapuma.Application',
                        'Elixir.Tapuma.DataCase','Elixir.Tapuma.Repo',
                        'Elixir.Tapuma.Transport',
                        'Elixir.Tapuma.Transport.Car','Elixir.TapumaWeb',
                        'Elixir.TapumaWeb.CarController',
                        'Elixir.TapumaWeb.CarView',
                        'Elixir.TapumaWeb.ChangesetView',
                        'Elixir.TapumaWeb.ChannelCase',
                        'Elixir.TapumaWeb.ConnCase',
                        'Elixir.TapumaWeb.Endpoint',
                        'Elixir.TapumaWeb.ErrorHelpers',
                        'Elixir.TapumaWeb.ErrorView',
                        'Elixir.TapumaWeb.FallbackController',
                        'Elixir.TapumaWeb.Gettext','Elixir.TapumaWeb.Router',
                        'Elixir.TapumaWeb.Router.Helpers',
                        'Elixir.TapumaWeb.UserSocket']},
              {registered,[]},
              {vsn,"0.0.1"},
              {mod,{'Elixir.Tapuma.Application',[]}},
              {extra_applications,[logger,runtime_tools,mssqlex,mssql_ecto]}]}.