package com.media.eximio

import com.media.eximio.auth.User

class JournalDownloader {
    
    static belongsTo = [journal:Journal]
    
    User downloader
    Date downloaddate

    static constraints = {
    }
}
