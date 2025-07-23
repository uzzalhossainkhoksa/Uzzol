# 📬 UzzolInboxMailer

![Uzzol Khoksa](https://github.com/uzzalhossainkhoksa/uzzol/blob/main/Life/Personal/Documents/uzzol_images/uzzol-khoksa.jpg)

**UzzolInboxMailer** is a lightweight yet powerful terminal-based **Email Outreach Automation** system developed for Termux and Ubuntu localhost. It integrates seamlessly with Google Sheets, Telegram notifications, and a web GUI to send, monitor, and manage mass email campaigns — all fully free and open-source.

---

## 🚀 Key Features

- ✅ Send up to **300+ inbox emails/day** using Gmail SMTP (free)
- ✅ Uses `Termux` or `Ubuntu localhost` without hosting cost
- ✅ Data logs and reply detection built-in
- ✅ Automatically update Google Sheet when emails are sent
- ✅ Telegram notifications for delivery, bounce, reply, unsub
- ✅ CLI + Web-based form (PHP/HTML) to submit podcasts or leads
- ✅ Follow-up email scheduling using crontab
- ✅ Fully customizable email template with variables

---

## 📁 Project Structure

```bash
UzzolInboxMailer/
├── README.md
├── config/
│   └── smtp.json                # SMTP credentials and settings
├── data/
│   └── podcasts.csv             # Your leads (name, email, etc.)
├── logs/
│   └── send_log.txt             # Email delivery log
├── scripts/
│   ├── send_emails.sh           # Main email sender script
│   └── add_podcast.sh           # CLI to add new podcast leads
├── templates/
│   └── email_template.txt       # Custom email content with variables
└── web/
    ├── index.html               # Submit form (to embed on Google Sites)
    └── submit.php               # Writes new leads to CSV
