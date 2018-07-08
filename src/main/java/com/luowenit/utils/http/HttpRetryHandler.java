package com.luowenit.utils.http;

import com.luowenit.exception.ServerException;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.protocol.HttpContext;

import javax.net.ssl.SSLException;
import java.io.IOException;
import java.io.InterruptedIOException;

public class HttpRetryHandler implements HttpRequestRetryHandler {
    @Override
    public boolean retryRequest(IOException exception, int executionCount, HttpContext httpContext) {
        if(executionCount >= 3){
            //如果超过最大重试次数，则不要重试
            return false;
        }
        if(exception instanceof InterruptedIOException){
            // 时间到
            return false;
        }

        if (exception instanceof ConnectTimeoutException) {
            // Connection refused
            return false;
        }
        if (exception instanceof SSLException) {
            // SSL handshake exception
            return false;
        }

        if(exception instanceof ServerException){
            return true;
        }
        HttpClientContext clientContext = HttpClientContext.adapt(httpContext);
        HttpRequest request = clientContext.getRequest();
        boolean idempotent = !(request instanceof HttpEntityEnclosingRequest);
        if (idempotent) {
            // Retry if the request is considered idempotent
            return true;
        }
        return false;
    }
}
