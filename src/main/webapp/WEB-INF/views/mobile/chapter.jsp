<%--
  Created by IntelliJ IDEA.
  User: 14521
  Date: 2018/7/2
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="app">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,minimal-ui">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/css/reset.css">
    <style type="text/css">
        html{
            width:100%;
            height:100%;
            overflow-x:hidden;
        }
        body{
            text-align:left;
            width:100%;
            overflow:hidden;
            background:#e9dfc7;
        }
        .m-fiction-container{
            font-size:14px;
            color:#555;
            line-height:31px;
            padding:15px;
        }
        .m-fiction-container h4{
            font-size: 20px;
            color:#736357;
            border-bottom: solid 1px #736357;
            letter-spacing:2px;
            margin: 0 0 1em 0;
        }
        .m-fiction-container p{
            letter-spacing: 0px;
            text-indent: 2em;
            line-height:24px;
            margin: 0.5em 0;
        }
        .u-tab li{
            display:inline-block;
            text-align:center;
            color:#fff;
            border-right:solid 1px #fff;
            width:49%;
        }
        .u-tab li:nth-child(2){
            border-right:none;
        }
        .nav-bar{
            background:#000;
            position:fixed;
            top:0px;
            z-index:9999;
            height:50px;
            width:100%;
        }
        .icon-back{
            position:absolute;
            top:14px;
            left:10px;
            width:23px;
            height:23px;
            background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFAAAABQCAYAAACOEfKtAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkJGMkEyQkQxMjdBNDExRTU4NjA2QTJDMjFDQ0I0ODhEIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkJGMkEyQkQyMjdBNDExRTU4NjA2QTJDMjFDQ0I0ODhEIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QkYyQTJCQ0YyN0E0MTFFNTg2MDZBMkMyMUNDQjQ4OEQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QkYyQTJCRDAyN0E0MTFFNTg2MDZBMkMyMUNDQjQ4OEQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4Ia560AAAHWklEQVR42uyd7W9U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);
            background-size:contain;
        }
        .nav-title{
            position:absolute;
            top:16px;
            left:42px;
            color:#d5d5d6;
        }
        .foot-nav{
            width:100%;
            height:70px;
            background:none;
            position:fixed;
            margin: 0 auto;
            text-align:center;
            opacity:1;
            bottom:0px;
            z-index:10004;
        }
        .foot-bar{
            background:#000;
            opacity:0.9;
        }
        .foot-bar-word .item{
            display:inline-block;
            width:32%;
            color:#fff;
            text-align:center;
            margin: 0 auto;
        }
        .item-wrapper{
            width:26px;
            margin:0 auto;
            position:relative;
        }
        .icon-text{
            position:absolute;
            top:25px;
            font-size:10px;
        }
        .icon-catelog,.icon-font,.icon-light-day,.icon-night-day{
            position:absolute;
            top:3px;
            left:2px;
            width:18px;
            height:13px;
        }
        .icon-catelog{
            background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAoCAYAAABerrI1AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkNFN0E3M0IwMjc4NDExRTU5RkYxQjg1Rjk2QkEyNzBEIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkNFN0E3M0IxMjc4NDExRTU5RkYxQjg1Rjk2QkEyNzBEIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6N0M1ODVCRkYyNzg0MTFFNTlGRjFCODVGOTZCQTI3MEQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6N0M1ODVDMDAyNzg0MTFFNTlGRjFCODVGOTZCQTI3MEQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5uTX6PAAAA0UlEQVR42uyXsQrCMBRFX4p0V39Pv8FJcekHFJe6d+v3NY6CDvUFooQ0AcEllnPhlgz3QU6bBq6ZnvdaRC7qndqoB/VR/ZC5wuxGytLtvXejUJ0uDlGgVZ8Tg6lsaWod1Jh461a9TQyMBX6hWLaSBary5zBWn8kPf8DUr/Rx8hfEPth4kxkIs+tCL4rG/VOLPH5AAQUUUEABBRRQv0O54nf1tcL6dZ3Jh9mpMH/2TkmkJFISKYmURKCAAgoooIACCihKIiWRkkhJpCR+XxJfAgwA/ROhOlYvoWQAAAAASUVORK5CYII=);
            background-size:contain;
        }
        .icon-font{
            height:13px;
            width:20px;
            background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEYAAAAuCAYAAACViW+zAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBCRTkzQUQ3Mjc4NzExRTU5RkYxQjg1Rjk2QkEyNzBEIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBCRTkzQUQ4Mjc4NzExRTU5RkYxQjg1Rjk2QkEyNzBEIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6Q0U3QTczQkEyNzg0MTFFNTlGRjFCODVGOTZCQTI3MEQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MEJFOTNBRDYyNzg3MTFFNTlGRjFCODVGOTZCQTI3MEQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6/hjRDAAAFqklEQVR42uRaaWwVVRi9fTbYqoBoEGIVrDsBA6JRAY0VSkQUl7pQI8YQGjTRaNCgBtdoApho3aoRRJaIC25/VBTBCiqCuKX+QDFqFANRsRCtsRWr9XzxNBnu++6bO/fNe9i+k5y0c2fmzrwz3/22mbKuv9pNChgCLgLHgBvABnCr6Qkor1CHy1ISZjVYG9leC55V6sLsB/4ucynj7T1VmEwKU09VRBHUmx6MNIS5JuF4SQhzIniKY5+MjypVYa4OtKb/PfJxvn3B7eABOY4Rp3wo2FZKzndajCiG+68otaWkLaP23rKcQoWRDHekMj5DGZPjTisVYWYqY+vB5/g3qZPuFcIMYFJn4wnrr50EDujtwlwFVlpjreBL/P9lbkdRyfMKBcmn7gRfAbeAO8G/wS7yT3Ab+AHYBF4I7ptmuJbUfzN4vDXeCN4U2X4AvNE65gtwOG80rYc6ndcdFnD+DnAe+ChCdme+wpzJyjmKLgr1VWTsOAph11A14LoURBkKrgBPTWGu98CLIE5rPktJC73NliiG5vxOgUK3WN3GlEQRnAG+Zjo7+oQKMxCsU8YXOI7XnHAd5wnFQeAb4GBl37fgXeDp4CGS09Jiy+hPxMoud0RNSSduDV1Kt4DzrbEfecHdyvHyBKSLN8galxu4L1CYp5lxRyGO9WbwcbDT00/OtYVg2VKFJdWWxGIyjtxliUMUw/HFjhwoJBqOVMoLuca54COeonT7xDmMUHbtV5d0KU0Ej7TG/gEXxpy3kMdFIfPUBghzneLMJUS/HTCXiPOYMl6bVBgtc30T/C7mPNm/KgUnvA94iTX2Cy0lFO87rNJbmCpwiqdz9XXCUzivLyqZK21g4tadSObTU96q5FSHJxFmBj18FD8wOvhgJY/fowviKDhz9XXuBccy4kg/eWkKofo3a/tAX2HkBzQo44sSODs57illvEER3Ac7mdxtTEGY/UNrpXOi5hXzQ3NBE1LmnbyXasSTafHlocJoTvJVFmRJsI3n7a12xCD6tfnM0j8CJ4UWkUeA3yjinQ2+FXBzkxS/JKH8KI/o5oP+4LHgMWA177+a20O8ZymvKDMxa9yViK1Kue0xkwlXyLmy1M/jw6pO08RcFiPp/PeOmiRt5CorcvWEbgePDrzmbpYld7gsxiXMpeALRXSGl4Evei6XpWw0JcEf7CN9Bn4Ivs4H0pVUmDXghCIK0+xxvT70UeMd+yXx+5RhfDOrbXH68u5rV47SwFsYcWBfFrDJVKP0arRmlw2tKyj4GnwYfJY5TtKaSRUm4wihtigi1LspWcc6zme3AnKFbnGs1yo/ai4bV00BogyM8+xRVBi9ab3ApNer7XI0t7Qmezemm+zm9f3gbQmddhQnJBFGKtiDrTFZa8tS9inLlAJQrnux4/gJSu10T573MD6JMFqmuyKH8wrFLkfUc7Ujhlvbn1Cc4DTF6O/GVGFGgOMczaZCQFtO4xQTzzBM21acD+rjcqBMzNNqYQ+kEJB5P/eon6RssD8jGWb0z9t8cBj4oE9aLZDPNaZ5PtU0oTWxtM9LWqxtyZTPD7ievO9abbIb9JHeQUcmKsxUxVxlDS8vsDDLFV/R32R/2LhSOfdJ4/8VhfRdZoEfmz3fomoRbXBUGG0ZPWMK/yVUGxOzuOW0mGm9nYes531eQCvqXl7lrNrr2QuSNmajZYm/gjco1x7RnfkOdZT9o1lbFBqjGWW0pC56X9czw42DtCv7xvig7VyKP5vsL9gfQvY7Syymw2S/4thUJFEM65tNisO1I4+8EZjnkWj2ixFFLHQUH4b0ordY+6+En+knwvzElDoaCmeb4mK2JUQT78vGHPZeWhLOL3M/D55k/ntptyOy724l0WyMFpE1jO3NrEyLDVk6E1lIrvU4fgxFGkv/UsWSQnxHK5dhC/3QGqe/dHy1+a8AAwCKR08FSRIHxQAAAABJRU5ErkJggg==);
            background-size:contain;
        }

        .current .icon-font{
            height:13px;
            width:20px;
            background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEwAAAA0CAYAAAAg5t6HAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkNFN0E3M0I4Mjc4NDExRTU5RkYxQjg1Rjk2QkEyNzBEIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkNFN0E3M0I5Mjc4NDExRTU5RkYxQjg1Rjk2QkEyNzBEIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6Q0U3QTczQjYyNzg0MTFFNTlGRjFCODVGOTZCQTI3MEQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6Q0U3QTczQjcyNzg0MTFFNTlGRjFCODVGOTZCQTI3MEQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7nhaYNAAANmElEQVR42uxbC1RV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);
            background-size:contain;
        }

        .icon-light-day{
            width:19px;
            height:18px;
            background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADkAAAA5CAYAAACMGIOFAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkNFN0E3M0I0Mjc4NDExRTU5RkYxQjg1Rjk2QkEyNzBEIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkNFN0E3M0I1Mjc4NDExRTU5RkYxQjg1Rjk2QkEyNzBEIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6Q0U3QTczQjIyNzg0MTFFNTlGRjFCODVGOTZCQTI3MEQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6Q0U3QTczQjMyNzg0MTFFNTlGRjFCODVGOTZCQTI3MEQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6o6V5PAAADu0lEQVR42uyaTUgVURTHm/cigiS1LEitoHoqbgtcZAStngtDoYxa9rFsYYuWfUBhuSjCneiylkH2oavoEZlC4aYsM9toakWLnpsWyfQfOMJrOvdjZs6bedQc+OF7d9499/y9M/fj3HFc110Xo3WAYfp8BozG0agTs8hFsIM+L4H6f1GkvzEnjkYz6/4DS0WmIlORSlsq+bxcKSI3gkHwBlwSGA3PkrjPNE+GnhXAZYprkOLUjOmYQjT0un/aMHAMdcqNQ3GUWq+ujqknt/i+nwZDcc1vih4cojh0cQbqyQaw4P5tSfQo14OezYNGXV0b5zly5Le+mEX2KQTmTHVtl3U58BQ0lpQtgJ2Gei2gE7SDVrANVIMf4Bt4B56Dh+C9wdc80/4RMGteTNr/J/09+lhzW3WBCTeYTVA91WPwKGgPBrldS9kFBkA/qGOuN4FnbjTz6jczvuuoXa/93UHilnxmjoMVV8ZWyJ9IbFICz4FVV9ZWyW9FiDwGfmmCnQIXQBuoBxvobxuVT2nqen57khbpPYNFRYBzoNtiPnXod3MKP0VqJxGRjmaQGQXVAf1VUz3VYOQkIbJLEdADkA3pM0v1OetKQuQ4E8gHUBXxEfDqzzC+x+MW2aL4b+eFRuu8wn9LGH9hN82dTNlrMCa02xgjf347GmdmoJ0puyu8rbrHlB2MU2QrUzYuLLJg2a6VyA7KbLsMi3Tdb9sVuwRJ+2TZrjF+b+4pTd2rkk/1hky4Z+vBapkz7lzW3Ri/ze3KpTqKTNlmYYG1TNlKmJRJpiSDxpkqq/aVKdsrLHIPU/ZFkwFUxu/dYk8M3c3ZNNjnKzsEXgmKPKxo12/G+MOOri+YslPCPXnSst2yTSEjTNkBkBcSmCd/Nu1aDF/hl15cDmdGYO26SXrtGuUs5AZT1kQrn2xIn1la6TQx1/rDT0TR9pMFxUL6fogeraJ6nBWS2k+uZQZUyauPtOO38dNNv1cltZqTzvH0WOZ49oMaqlND321yPCfSbF2ad5UXufaMFiIKLER9BqOK9Ea4m2CZEk61mrOQyYDiJjUpzFpqb5nad8olkjsfvG6RC7oIRsBsSY62SN9H6Lopd3MtyvmorcCM4gD0dkxnk7eiHARHEWg84RWkUXPinZEQeSXsCa8wOYXQqxIi31aAQN3R/rTEAv1lqCNs3taSTqoEmclmqf2FIFlCm3cGvBeBzoOt4I7vraqgJvW+awPF9B0MgJ9RRZYz+5a+75qKTEWmIstuFfm+q7RJve8ayH4LMACaxEJEaXs23AAAAABJRU5ErkJggg==);
            background-size:contain;
        }
        .icon-night-day{
            left:4px;
            width:16px;
            height:16px;
            background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkU2OUYzRUEwMjc4NzExRTU5RkYxQjg1Rjk2QkEyNzBEIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjhBMzA2RjA2Mjc4QTExRTU5RkYxQjg1Rjk2QkEyNzBEIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RTY5RjNFOUUyNzg3MTFFNTlGRjFCODVGOTZCQTI3MEQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RTY5RjNFOUYyNzg3MTFFNTlGRjFCODVGOTZCQTI3MEQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4v5YACAAAC/UlEQVR42tSaXYhNURTH97kzRnJ9ZTQzPh7IMEr5yshHEwkRkSeSjweEiMjDePTkhcKLPCApUV54GxTKcDM0JfL9QE0UGdcdEmb7L3edOq5zzz1nn332Pvdfv5e5Z9Zd666711577etIKYUGjQILwRwwDOwDfcKAamP873CwBawDrcABP8ACU87/FWUgIk3gKMjL/7VfwV4sojxcCw6AL9JfD0DGdABhv0KTwAUwO+CZvaBfGFaYAJaDyyAb8Mwt0CksKFPh9W3gWgXnSSeFJTkBZXQrOM3VJUi9oJErUGoysBKcCuE86YYt58sF0MILtiakjTvCojI+i/o876Zh9ThNARysUCr99NpmAN5FTAvxBRgS0QZlK5+GDLQrOC9sOu/NADVm70LU+9RmYJOi8yLigk8sgPUxbEy0HUATH0RUNdV2AG0hd9xyarMdwNyYNhaDOpsBTI5pYwRYYTMAHYtwh80ARmqws1ShBdEWwGAdGyI4HrMYKAegawFSMdhlo5XIK/ZAfvoO5oFukxn4oNHeID5DjzUZwCvNNsn5DjDOVADPErA7BdwF0xP2v4YCyCVknDJwjxe2k8AHT4O0VTSeawD9Mll1glZN48T5IMc+N7p/7JJm1AFWg4ERna4Da8F1j62cdzZKY5RZBtbcEuYzuAlugyfgOSjwyS7LJ8QJYJoojuuX+RycLnqPlPXgLZfBalCB11iveyL7CM6K6tEZURxp/jNWGc2pzFbBp98M3peOVXrA4Sr49I+4zpdmgDSA94UZKXX+ITeNP8sFIDg9XWBoypyni0O6THzqN1bx6iXYCH6nyHnyZXOp8+UCIF0Fe1LiPH1FdoMr/q8G74DbwS9pT/TeO+Nes64JuFpNUl+5fdByT9wMHhl0vhu06L7opobqEPiWoON9oJ0v1bXf1LuMAcdAQbPjJ6g9juqPE+PXKvVcbjeAmQqHFsmb5iVwzu1tVKYSOkpdA1jEU246To4XxZ/gZLlUU5v8CbzhI+x9bqV74r7xHwEGAPDRVwnecW5KAAAAAElFTkSuQmCC
            );
            background-size:contain;
        }
        .foot-pannel-bk{
            position:fixed;
            width:100%;
            height:135px;
            bottom:70px;
            background:#000;
            opacity: 0.9;
            z-index:10000;
        }
        .foot-pannel{
            position:fixed;
            width:100%;
            height:135px;
            bottom:70px;
            background:none;
            color:#fff;
            z-index:10001;
        }
        .child-pannel{
            padding: 5px 10px;
            margin:15px;
        }
        .child-pannel span{
            display:inline-block;
            padding-right:20px;
            padding-left:10px;
        }
        .font-change{
            background:none;
            border:1px solid #8c8c8c;
            color:#fff;
            border-radius: 16px;
            padding:5px 40px;
        }
        .child-pannel button:nth-child(2){
            margin-right:10px;
        }
        .icon-color-bar{
            position:relative;
            width:30px;
            height:30px;
            border-radius: 15px;
            display:inline-block;
            vertical-align: -14px;
            margin-left: 5px;
        }
        .icon-color-current{
            position:absolute;
            top:-2px;
            left:-2px;
            width:32px;
            height:32px;
            border-radius: 16px;
            display: inline-block;
            border:1px solid #ff7800;
        }
        .color1{
            background:#f7eee5;
        }
        .color2{
            background:#e9dfc7;
        }
        .color3{
            background:#a4a4a4;
        }
        .color4{
            background:#cdefce;
        }
        .color5{
            background:#283548;
        }
        .artical-action-mid{
            z-index:10002;
            width:100%;
            position:fixed;
            height:40%;
            top:30%;
        }


    </style>
</head>
<body>
<div id="root">
    <!-- 响应触摸屏幕，唤出上下边栏的结构 -->
    <div class="m-artical-action">
        <div class="artical-action-mid" id="action_mid"></div>
    </div>

    <!-- 上边栏 -->
    <a href="/${chapter.fiction_id}/1/0/fiction.html">
    <div id="nav_bar" class="nav-bar" style="display:none">
        <div class="icon-back"></div>
        <div class="nav-title">返回书架</div>
    </div>
    </a>
    <!-- 下边栏 -->
    <div id="foot-bar" class="foot-bar  foot-nav" style="display:none"></div>
    <div id="foot-bar-word" class="foot-bar-word  foot-nav" style="display:none">
        <a href="/${chapter.fiction_id}/1/1/fiction.html"><div class="item m-catelog-bar">
            <div class="item-wrapper">
                <div class="icon-catelog"></div>
                <div class="icon-text">
                    目录
                </div>
            </div>
        </div></a>
        <div class="item m-font-bar">
            <div class="item-wrapper">
                <div class="icon-font"></div>
                <div class="icon-text">
                    字体
                </div>
            </div>
        </div>
        <div class="item m-day-change-bar">
            <div class="item-wrapper">
                <div class="night-day">
                    <div class="icon-night-day"></div>
                    <div class="icon-text">
                        夜间
                    </div>
                </div>
                <div class="light-day" style="display:none">
                    <div class="icon-light-day"></div>
                    <div class="icon-text">
                        白天
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 控制面板 -->
    <div class="foot-pannel-bk pannel-control" style="display:none"></div>
    <div class="foot-pannel pannel-control" style="display:none">
        <div class="child-pannel" id="font-pannel">
            <span class="font-word">字号</span>
            <button class="font-change" id="big_font">大</button>
            <button class="font-change" id="small_font">小</button>
        </div>
        <div class="child-pannel color-pannel">
            <span class="color-change">颜色</span>
            <div class="icon-color-bar color1" id="color1">
                <div class="color1-bk"></div>
            </div>
            <div class="icon-color-bar color2" id="color2">
                <div class="color2-bk"></div>
            </div>
            <div class="icon-color-bar color3" id="color3">
                <div class="color3-bk"></div>
            </div>
            <div class="icon-color-bar color4" id="color4">
                <div class="color4-bk"></div>
            </div>
            <div class="icon-color-bar color5" id="color5">
                <div class="color5-bk"></div>
            </div>
        </div>
    </div>

    <!-- 文章主题内容 -->
    <h1 id="ctitle" style="height:30px;width:100%;position: fixed; top: 0;background-color:#e9dfc7;"><span style="line-height: 30px;margin-left:10px;">${chapter.name}</span></h1>
    <div style="height: 30px;"></div>
    <div id="fiction_container" class="m-fiction-container">
        <div id="fiction_word">
            <h1 style='font-size: 0.97rem;padding: 10px 0;'>${chapter.name}</h1>
            <div class="content">
                ${chapter.content}
            </div>
        </div>

        <%--<div id="change_page" onclick="loading()" class="m-button-bar" style="text-align: center;background: #4284ee;border-radius: 99px;color: white;">
            加载下一章
        </div>--%>
    </div>


</div>
<%--<script src="/js/zepto.min.js"></script>--%>
<script src="/js/jquery-2.0.3.min.js"></script>
<script>
    window.jQuery = $;
</script>
<%--<script src="/js/jquery.base64.js"></script>--%>
<%--<script src="/js/jquery.jsonp.js"></script>--%>



<script>
    (function(){
        'use strict'
        // 数据存储部分

        var Util = (function(){
            // localStorage共享一个域，为避免冲突，给每个Key加上前缀
            var prefix = 'fiction_reader_';
            var StorageGetter = function(key){
                return localStorage.getItem(prefix+key);
            }
            var StorageSetter = function(key, value){
                return localStorage.setItem(prefix+key, value);
            }

            var getJSONP = function(url, callbackFun){
                $.jsonp({
                    url:url,
                    cache:true,
                    callback:'duokan_fiction_chapter',
                    success:function(json){
                        var decodeJson = $.base64.decode(json);
                        callbackFun(decodeJson);
                        // debugger;
                    }
                });
            }

            // 事件委托的函数
            var addHandler = function(element, type, handler){
                if(element.addEventListener){
                    element.addEventListener(type, handler, false);
                }else if(element.attachEvent){
                    element.attachEvent('on'+type, handler);
                }else{
                    element['on'+type] = handler;
                }
            };

            var getEvent = function(event){
                return event? event:window.event;
            }

            var getTarget = function(event){
                return event.target || event.srcElement;
            }

            var changeBkColor = function(BkColor){
                initBkColor = BkColor;
                Dom.fiction_area.css('background-color',initBkColor);
                Util.StorageSetter('background-color',initBkColor);
            }

            var changeBkClass = function(target_id){
                Dom.color1_bk.removeClass('icon-color-current');
                Dom.color2_bk.removeClass('icon-color-current');
                Dom.color3_bk.removeClass('icon-color-current');
                Dom.color4_bk.removeClass('icon-color-current');
                Dom.color5_bk.removeClass('icon-color-current');

                $('.'+target_id+'-bk').addClass('icon-color-current');
            }

            return {
                getJSONP:getJSONP,
                addHandler:addHandler,
                getEvent:getEvent,
                getTarget:getTarget,
                changeBkColor:changeBkColor,
                changeBkClass:changeBkClass,
                StorageSetter:StorageSetter,
                StorageGetter:StorageGetter
            }
        })();

        var Dom = {
            top_nav: $('#nav_bar'),
            bottom_nav:$('.foot-nav'),
            font_button:$('.m-font-bar'),
            pannel_control:$('.pannel-control'),
            night_day:$('.night-day'),
            light_day:$('.light-day'),
            fiction_area:$('#fiction_container'),
            fiction_word:$('#fiction_word'),
            color1_bk:$('.color1-bk'),
            color2_bk:$('.color2-bk'),
            color3_bk:$('.color3-bk'),
            color4_bk:$('.color4-bk'),
            color5_bk:$('.color5-bk')
        };

        var readerModel;
        var readerBaseFrame;

        var Win = $(window);
        var Doc = $(document);
        var initFontSize = Util.StorageGetter('font-size');
        initFontSize = parseInt(initFontSize);
        if(!initFontSize){
            initFontSize = 14;
        }
        Dom.fiction_area.css('font-size', initFontSize);

        var initBkColor = Util.StorageGetter('background-color');
        if(!initBkColor){
            initBkColor = '#f7eee5';
        }
        Dom.fiction_area.css('background-color', initBkColor);

        var Chapter_length;
        var Chapter_id;

        function main(){
            // todo 整个项目的入口函数
            EventHandler();
            readerModel = ReaderModel();
            readerBaseFrame = ReaderBaseFrame(Dom.fiction_word);

            readerModel.init(function(data){
                readerBaseFrame(data);
            });

        }

        function ReaderModel(){
            // TODO 获取数据

            var init = function(callbackFun){
                // debugger;
                /*getFictionInfo(function(data){
                    getSingleChapterInfo(data, callbackFun);
                });*/
            }


            var getFictionInfo = function(callback){
                $.get('data/chapter.json', function(data){
                    // TODO
                    Chapter_length = data.chapters.length;
                    //
                    if(Util.StorageGetter('chapter_id') == null){
                        Chapter_id = parseInt(data.chapters[0].chapter_id + 1);
                    }else{
                        Chapter_id = parseInt(Util.StorageGetter('chapter_id'));
                    }
                    // debugger;
                    callback && callback(Chapter_id);
                }, 'json');
            }

            var getSingleChapterInfo = function(chapter_id, callbackFun){
                $.get('data/data'+ chapter_id + '.json', function(data){
                    //todo
                    var url = data.jsonp;
                    Util.getJSONP(url, callbackFun);
                    // debugger;
                }, 'json');
            }

            var gotoChapter = function(){
                getSingleChapterInfo(Chapter_id, function(data){
                    // debugger;
                    readerBaseFrame(data);
                });
            }

            var getPreChapter = function(){
                if(Chapter_id <= 1){
                    return;
                }
                Chapter_id -= 1;
                // debugger;
                Util.StorageSetter('chapter_id', Chapter_id);
                gotoChapter();
                $(window).scrollTop(0);
            }

            var getNextChapter = function(){
                // 由于只有4个data.json文件，所以这里写死
                if(Chapter_id >= 4){
                    // if(Chapter_id >= Chapter_length + 1){
                    return;
                }
                Chapter_id += 1;
                // debugger;
                Util.StorageSetter('chapter_id', Chapter_id);
                gotoChapter();
                $(window).scrollTop(0);
            }

            return {
                init:init,
                gotoChapter:gotoChapter,
                getPreChapter:getPreChapter,
                getNextChapter:getNextChapter,
                getFictionInfo:getFictionInfo,
                getSingleChapterInfo:getSingleChapterInfo
            };
        }

        function ReaderBaseFrame(container){
            // TODO 渲染基本的UI结构
            function parseChapterData(data){
                var jsonObj = JSON.parse(data);
                var html = '<h4>' + jsonObj.t+'</h4>';
                for(var i = 0; i < jsonObj.p.length; i++){
                    html += '<p>' + jsonObj.p[i]+ '</p>';
                }
                return html;
            }
            return function(data){
                container.html(parseChapterData(data));
            }

        }

        function EventHandler(){
            // todo 交互事件的绑定
            // 上下翻页
            $('#prev_page').click(function(){
//                console.log('you clicked the prev page.');
                readerModel.getPreChapter();
            });

            $('#next_page').click(function(){
//                console.log('you clicked the next page.');
                readerModel.getNextChapter();
            });

            // 点击屏幕中间区域，上下边栏出现或消失
            $('#action_mid').click(function(){
//                console.log("you clicked the screen");
                if(Dom.top_nav.css('display')=='none'){
                    Dom.top_nav.show();
                    Dom.bottom_nav.show();
                }else{
                    Dom.top_nav.hide();
                    Dom.bottom_nav.hide();
                    Dom.pannel_control.hide();
                }
                Dom.font_button.removeClass('current');
            });

            // 滚动页面，上下边栏消失，控制面板消失
            Win.scroll(function(){
//                console.log('you scrolled the screen.');
                Dom.top_nav.hide();
                Dom.bottom_nav.hide();
                Dom.pannel_control.hide();
                Dom.font_button.removeClass('current');
            });

            // 点击字体，控制面板出现或隐藏
            Dom.font_button.click(function(){
//                console.log("You clicked the font button.");
                if(Dom.pannel_control.css('display') == 'none'){
                    Dom.pannel_control.show();
                    Dom.font_button.addClass('current');
                }else{
                    Dom.pannel_control.hide();
                    Dom.font_button.removeClass('current');
                }
            });

            // 点击白天或夜晚，模式切换
            Dom.night_day.click(function(){
//                console.log('you clicked the night day');
                Dom.night_day.hide();
                Dom.light_day.show();
                initBkColor = '#283548';
                Dom.fiction_area.css('background-color',initBkColor)
                Util.StorageSetter('background-color',initBkColor);
                Dom.font_button.removeClass('current');

            });

            Dom.light_day.click(function(){
//                console.log('you clicked the light day');
                Dom.light_day.hide();
                Dom.night_day.show();

                initBkColor = '#e9dfc';
                Dom.fiction_area.css('background-color',initBkColor)
                Util.StorageSetter('background-color',initBkColor);
                Dom.font_button.removeClass('current');
            });

            // 放大或缩小字体
            $('#big_font').click(function(){
//                console.log('you clicked the bigger font');
                if(initFontSize > 20){
                    return ;
                }
                initFontSize += 1;
                Dom.fiction_area.css('font-size', initFontSize);
                Util.StorageSetter('font-size', initFontSize);
            });

            $('#small_font').click(function(){
//                console.log('you clicked the smaller font.');
                if(initFontSize < 10){
                    return ;
                }
                initFontSize -= 1;
                Dom.fiction_area.css('font-size', initFontSize);
                Util.StorageSetter('font-size', initFontSize);
            });

            // 设置背景色
            // 使用事件委托的方式
            Util.addHandler($('.color-pannel')[0], 'click', function(event){
                var event = Util.getEvent(event);
                // debugger;
                var target = Util.getTarget(event);

                switch(target.id){
                    case 'color1':
                        Util.changeBkColor('#f7eee5');
                        Util.changeBkClass(target.id);
                        $("#ctitle").css("background","#f7eee5");
                        break;
                    case 'color2':
                        Util.changeBkColor('#e9dfc7');
                        Util.changeBkClass(target.id);
                        $("#ctitle").css("background","#e9dfc7");
                        break;
                    case 'color3':
                        Util.changeBkColor('#a4a4a4');
                        Util.changeBkClass(target.id);
                        $("#ctitle").css("background","#a4a4a4");
                        break;
                    case 'color4':
                        Util.changeBkColor('#cdefce');
                        Util.changeBkClass(target.id);
                        $("#ctitle").css("background","#cdefce");
                        break;
                    case 'color5':
                        Util.changeBkColor('#283548');
                        Util.changeBkClass(target.id);
                        $("#ctitle").css("background","#283548");
                        break;
                    default:
                        break;
                }
            });

        }

        main();
    })();

    var pageIndex = parseInt("${chapter.number+1}");
    var pageCount = parseInt("${total}");
    var flag=true;
    var lastTitle;
    var harr =[];
    window.onscroll=function(){
        // 窗口可视范围的高度
       /* console.log($(window).height());
        console.log($(document.body).height());
        console.log($(document).scrollTop());*/

        var height=$(window).height();
        var theight=$(document).scrollTop();
        var rheight=$(document.body).height();
        var bheight=parseInt(rheight-theight-height);

        var a=false;
        for (var j=0;j<harr.length;j++) {
            if(theight>harr[j].min && theight<harr[j].max){
                $("#ctitle").find("span").text(harr[j].title);
                a=true;
                break;
            }
        }
//        console.log(a);
        if(a===false){
            $("#ctitle").find("span").text(lastTitle);
        }

        if( bheight < 100 && bheight > 0 ){
            if(pageIndex > pageCount){
                //console.log("end。。。")
                return false;
            }
            if($("#tip").length <=0){
                $("#fiction_word").append("<div id='tip' style='height:30px;line-height:30px;width:100%;text-align: center'>数据正在加载中...</div>");
            }
            if(flag){
                flag=false;
                $.ajax({
                    url: "/${chapter.fiction_id}/"+pageIndex+"/chapter.html",
                    type: "get",
                    dataType: 'json',
                    success: function (data) {
                        if(harr.length==0){
                            harr.push({'min':0,'max':theight,'title':"${chapter.name}"});
                        }else{
                            harr.push({'min':harr[harr.length-1].max,'max':theight,'title':lastTitle});
                        }
                        lastTitle = data.name;
                        pageIndex++;
//                        console.log(data);

                        var html="";
                        html+="<h1 style='font-size: 0.97rem;padding: 10px 0;'>"+data.name+"</h1>"
                        html +="<div class=\"content\">";
                        html += data.content;
                        html += "</div>";
                        $("#fiction_word").append(html);
                        $("#ctitle").find("span").text(data.name);
                        $("#tip").remove();
                        flag=true;
                    },
                    error: function () {
                        console.log("出错了");
                    }
                });
            }

            return false;
        }
    }
</script>
</body>
</html>
