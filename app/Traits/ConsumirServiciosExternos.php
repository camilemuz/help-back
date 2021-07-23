<?php

namespace App\Traits;

use GuzzleHttp\Client;

trait ConsumirServiciosExternos
{
    public function performRequest($method, $requestUrl, $formParams = [], $headers = [])
    {
        $client = new Client([
            'base_uri' => $this->baseUri,
        ]);
        if (isset($this->secret)) {
            $headers['Authorization'] = $this->secret;
        }
        if ($method == 'GET') {
            $response = $client->request($method, $requestUrl . "?" . http_build_query($formParams), ['headers' => $headers]);
        } else {
            $response = $client->request($method, $requestUrl, ['form_params' => $formParams, 'headers' => $headers]);
        }
        return $response->getBody()->getContents();
    }

    public function performFileStoreRequest($requestUrl, $archivo, $formParams = [], $headers = [])
    {
        $multipartArray = [
            [
                'name' => 'archivo',
                'contents' => $archivo,
                'filename' => 'nombre'
            ],
            [
                'name' => 'tipo',
                'contents' => 'movil'
            ]
        ];
        foreach ($formParams as $key => $param) {
            array_push($multipartArray, [
                'name' => $key,
                'contents' => $param
            ]);
        }
        $client = new Client([
            'base_uri' => $this->baseUri,
        ]);
        if (isset($this->secret)) {
            $headers['Authorization'] = $this->secret;
        }
        $response = $client->request('POST', $requestUrl, ['multipart' => $multipartArray, 'headers' => $headers]);
        return $response->getBody()->getContents();
    }

    public function performFileDestroyRequest($requestUrl, $headers = [])
    {
        $client = new Client([
            'base_uri' => $this->baseUri,
        ]);
        if (isset($this->secret)) {
            $headers['Authorization'] = $this->secret;
        }
        $response = $client->request('DELETE', $requestUrl);
        return $response->getBody()->getContents();
    }
}