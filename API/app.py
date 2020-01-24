from flask import Flask
from flask_restful import Resource, Api
import twitter

app = Flask(__name__)
api = Api(app)

ACCESS_TOKEN = ''
ACCESS_TOKEN_SECRET = ''
CONSUMER_KEY = ''
CONSUMER_SECRET = ''

twitter_api = twitter.Api(CONSUMER_KEY,
                          CONSUMER_SECRET,
                          ACCESS_TOKEN,
                          ACCESS_TOKEN_SECRET)


def get_tweets(search_query: str) -> list:
    query = 'q=%22' + search_query + '%22%20-RT%20lang%3Aen%20until%3A2020-01-23%20since%3A2019-01-29%20-filter%3Alinks%20' \
                              '-filter%3Areplies&src=typed_query&count=1'
    results = twitter_api.GetSearch(raw_query=query,
                                    return_json=True,
                                    lang='en')
    return results


class Tweets(Resource):
    def get(self, search_query):
        results = get_tweets(search_query)
        only_tweets = results['statuses']
        tweets = []
        i = 0
        for tweet in only_tweets:
            tweets.append({'text': tweet['text']})
            i = i + 1
        final_tweets = {'tweets': tweets}
        return final_tweets



api.add_resource(Tweets, '/<string:search_query>')

if __name__ == '__main__':
    app.run(debug=True, port=5000)
