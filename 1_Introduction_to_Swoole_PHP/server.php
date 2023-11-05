<?php
require 'vendor/autoload.php';

use OpenSwoole\Http\Server;
use OpenSwoole\Http\Request;
use OpenSwoole\Http\Response;
use OpenSwoole\Coroutine as co;

$server = new Server("0.0.0.0", 9501);

$server->on("start", function (Server $server) {
    echo "Swoole http server is started at http://127.0.0.1:9501\n";
});

$server->on("request", function (Request $request, Response $response) {
    if ($request->server['request_uri'] === '/favicon.ico') {
        $response->status(404);
        $response->end();
        return;
    }
    $response->header("Content-Type", "text/plain");

    $requestCid = co::getCid();
    go(function () use ($requestCid) {
        co::sleep(1);
        $cid = co::getCid();
        echo "Done $cid, request handled by $requestCid\n";
    });

    $response->end("Hello World\n");
});

$server->start();