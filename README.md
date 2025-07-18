# URI Redirect Service

A lightweight web service that converts HTTP URLs into custom URI schemes (like `logseq://`, `obsidian://`, `message://`) for seamless integration with external applications.

## 🎯 Purpose

This tool allows you to embed custom URI links in web-based platforms (like Notion) by converting them to clickable HTTP URLs that automatically redirect to the target application.

## ✨ Features

- **Universal URI Support**: Works with any custom URI scheme (`logseq://`, `obsidian://`, `message://`, etc.)
- **Auto-close Tabs**: Automatically attempts to close the redirect tab after launching the target application
- **GitHub Pages Ready**: Can be hosted on GitHub Pages or any static hosting service
- **Clean Fallback**: Shows user-friendly message with manual close option if auto-close fails

## 🚀 Usage

### Basic URL Format

```text
https://your-domain.com/redirect/?url={encoded_uri}
```

### Example

original URI: `message://%3c80d1fc1b-4053xxxx16c@in.tum.de%3e`

can be converted to:


`https://vigeng.github.io/redirect/?url=message%3A//%2Fc80d1fc1b-4053xxxx16c%40in.tum.de%253e`

↓ when you visit it, it redirects to ↓

```text
message://%3c80d1fc1b-4053xxxx16c@in.tum.de%3e
```

## 🛠️ Setup

1. **Clone or fork this repository**
2. **Enable GitHub Pages** in repository settings (or deploy to your preferred static host)
3. **Use the URL** in your applications by encoding your target URI

## 📝 URL Encoding

Make sure to properly URL-encode your target URI when using as the `url` parameter.

---

*Perfect for embedding deep links in Notion, documentation, or any web platform that supports HTTP links but not custom URI schemes.*


Feel free to contribute or open issues for any enhancements or bugs you encounter!