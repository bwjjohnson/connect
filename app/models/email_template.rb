class EmailTemplate < ActiveRecord::Base
  def body_html
    body.gsub(/\n/, "<br>").raw
  end
end
