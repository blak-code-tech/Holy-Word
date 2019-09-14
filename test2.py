# Download the helper library from https://www.twilio.com/docs/python/install
from twilio.rest import Client


# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure
account_sid = 'AC72cd28acc3ba558c9a1a006e8c9e3dfd'
auth_token = 'b0c125d04b172c294dc267e1252417a6'
client = Client(account_sid, auth_token)

call = client.calls.create(
                        url='http://demo.twilio.com/docs/voice.xml',
                        to='+233263352399',
                        from_='+12053031955l'
                    )

print(call.sid)
