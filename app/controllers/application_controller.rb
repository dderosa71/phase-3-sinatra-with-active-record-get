class ApplicationController < Sinatra::Base

  get '/games/:id' do
    game = Game.find(params[:id])

    # include associated reviews in the JSON response
    game.to_json(only: [:id, :title, :genre, :price], include: {
      reviews: { only: [:comment, :score], include: {
        user: { only: [:name] }
      } }
    })
  end

  # use the :id syntax to create a dynamic route
  get '/games/:id' do
    game = Game.find(params[:id])
    # send a JSON-formatted response of the game data
    game.to_json
  end

end
