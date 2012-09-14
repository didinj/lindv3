package com.media.eximio

class FriendRequestService {

    static transactional = false

    static atmosphere = [mapping: '/atmosphere/friendrequest']

    def onRequest = { event ->
        log.info "onRequest, $event"

        // Mark this connection as suspended.
        event.suspend()
    }

    def onStateChange = { event ->
        if (event.cancelled){
            log.info "onStateChange, cancelling $event"
        }
        else if (event.message) {
            log.info "onStateChange, message: ${event.message}"

            event.resource.response.writer.with {
                write event.message
                flush()
            }
        }
    }
}