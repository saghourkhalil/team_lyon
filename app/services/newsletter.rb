class Newsletter
    def initialize
      @gibbon = Gibbon::Request.new(api_key: Rails.application.credentials.dig(:mailchimp_api_key))
      @new_campaign
    end
  
    def create_campaign
      recipients = {
        list_id: "8fd9822a2a",
      }
      settings = {
        subject_line: "Newsletter THP",
        title: "Vous aimez les chat?",
        from_name: "chattt",
        reply_to: "ralondebilon69@gmail.com",
        template_id: 57009
      }
      body = {
        type: "regular",
        recipients: recipients,
        settings: settings,
      }
  
      begin
        @new_campaign = @gibbon.campaigns.create(body: body)
      rescue Gibbon::MailChimpError => e
        puts "Sa marche ap: #{e.message} - #{e.raw_body}"
      end
      puts "Nouvelle campagne MailChimp créé"
    end
    
    def send_campaign
      @gibbon.campaigns(@new_campaign.body['id']).actions.send.create
      puts "Newsletter envoyée"
    end 
  
    def perform
      create_campaign
      send_campaign
    end
  end