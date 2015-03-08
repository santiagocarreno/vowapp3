class UserProvider < ActiveRecord::Base
  belongs_to :user


      def self.find_for_facebook_oauth(auth)

        user = UserProvider.where(:provider => auth.provider, :uid => auth.uid).first
        unless user.nil?
            user.user
        else
            registered_user = User.where(:email => auth.info.email).first
            unless registered_user.nil?
                        UserProvider.create!(
                              provider: auth.provider,
                              uid: auth.uid,
                              user_id: registered_user.id
                              )
                registered_user
            else
                user = User.create!(
                    name: auth.info.name,
                            email: auth.info.email,
                            password: Devise.friendly_token[0,20],
                            )
                user_provider = UserProvider.create!(
                    provider:auth.provider,
                            uid:auth.uid,
                              user_id: user.id
                    )
                user
            end
        end
    end

    def self.find_for_twitter_oauth(auth)
          user = UserProvider.where(:provider => auth.provider, :uid => auth.uid).first
          unless user.nil?
                user.user
          else
                registered_user = User.where(:username => auth.info.nickname).first
              unless registered_user.nil?
                        UserProvider.create!(
                              provider: auth.provider,
                              uid: auth.uid,
                              user_id: registered_user.id,
                          username: auth.info.nickname,
                          reach_in: auth.followers_count,
                          reach_out: auth.friends_count,
                          likes: auth.favourites_count,
                          token: auth.credentials.token,
                           secret: auth.credentials.secret,
                            
                              )
                   registered_user
              else
                user = User.create!(
                       email: "#{auth.info.nickname}@email.com",
                        username: auth.info.nickname,                      
                          password: Devise.friendly_token[0,20],
                          name: auth.info.name,
                          photo_url: auth.info.image,
                          )

                    user_provider = UserProvider.create!(
                        provider:auth.provider,
                          uid:auth.uid,
                          user_id: user.id,
                          username: auth.info.nickname,
                          reach_in: auth.followers_count,
                          reach_out: auth.friends_count,
                          likes: auth.favourites_count,
                          token: auth.credentials.token,
                           secret: auth.credentials.secret,
                         
                         
                        )
                    user
              end

        end
    end
end