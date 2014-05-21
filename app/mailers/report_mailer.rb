class ReportMailer < ActionMailer::Base
  default from: "collaborateur.app@gmail.com"

  def MailReports(email)
    CSV.open("#{Rails.root}/public/reports.csv","w") do |csv|
        csv << ["created_at","sleep","exercise","energy","mood","weight","stress"]
        Report.all.each do |report|
          csv << [report.created_at, report.sleep, report.excercise, report.energy,report.mood,report.weight,report.stress]
        end
      end
    attachments["reports.csv"] = File.read("#{Rails.root}/public/reports.csv")
    mail(to: email,
        bcc: "collaborateur.app@gmail.com",
        subject: "Diary Entries")
  end
end

