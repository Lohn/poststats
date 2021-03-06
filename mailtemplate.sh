#!/bin/bash

# __          _______  _  __
# \ \        / /  __ \| |/ /
#  \ \  /\  / /| |  | | ' / 
#   \ \/  \/ / | |  | |  <  
#    \  /\  /  | |__| | . \ 
#     \/  \/   |_____/|_|\_\
# 
# Copyright (c) 2017 Webdesign Kronberg.
# ----------------------------------------------------------------------------
# This file contains the e-mail template.
# ----------------------------------------------------------------------------

body=$(cat <<TEMPLATE
<html>

<head>
    <title>$MAILSUBJECT</title>
    <style>
        body {
            background-color: #ffffff;
            padding: 5px;
            font-family: arial, helvetica, sans-serif;
            font-size: 10px;
        }

        table {
            border-spacing: 0px;
            border-collapse: collapse;
            margin: 5px 0 0 0;
            padding: 0;
            width: 100%;
            color: black;
            empty-cells: show;
        }

        table th {
            font-weight: normal;
            border-right: 1px solid #cccccc;
            background-color: #999999;
            text-align: center;
            color: #ffffff;
            vertical-align: middle;
            font-size: 9pt;
            height: 14px;
        }

        table th:last-child {
            border-right-style: none;
        }

        table tr>td {
            border-right: 1px solid #cccccc;
            padding: 2px 4px;
            height: 22px;
            vertical-align: middle;
        }

        table tr td:last-child {
            border-right-style: none;
        }

        table a {
            text-decoration: none;
            color: black;
        }

        table a:hover {
            text-decoration: underline;
        }

        table tr td {
            padding-bottom: 4px;
            padding: 4px 5px 2px 5px;
            text-align: left;
            height: 16px;
            line-height: 14px;
            vertical-align: top;
            font-size: 9pt;
        }

        table tr td.left {
            width: 10%;
            white-space: nowrap;
            vertical-align: top;
            padding-right: 20px;
        }

        table tr.even0 td.left {
            background-color: #bbbbbb;
        }

        table tr.odd0 td.left {
            background-color: #cccccc;
        }

        tr.odd0 {
            background-color: #eeeeee;
        }

        tr.even0 {
            background-color: #dddddd;
        }

        td.odd0 {
            background-color: #eeeeee;
        }

        td.even0 {
            background-color: #dddddd;
        }

        .stateOK,
        .stateUP {
            padding-left: 3px;
            padding-right: 3px;
            border-radius: 2px;
            font-weight: bold;
            background-color: #0b3;
            color: #ffffff;
        }

        .stateWARNING {
            padding-left: 3px;
            padding-right: 3px;
            border-radius: 2px;
            font-weight: bold;
            background-color: #ffff00;
            color: #000000;
        }

        .stateCRITICAL,
        .stateDOWN {
            padding-left: 3px;
            padding-right: 3px;
            border-radius: 2px;
            font-weight: bold;
            background-color: #ff0000;
            color: #ffffff;
        }

        .stateUNKNOWN,
        .stateUNREACHABLE {
            padding-left: 3px;
            padding-right: 3px;
            border-radius: 2px;
            font-weight: bold;
            background-color: #ff8800;
            color: #ffffff;
        }

        .statePENDING {
            padding-left: 3px;
            padding-right: 3px;
            border-radius: 2px;
            font-weight: bold;
            background-color: #888888;
            color: #ffffff;
        }

        .stateDOWNTIME {
            padding-left: 3px;
            padding-right: 3px;
            border-radius: 2px;
            font-weight: bold;
            background-color: #00aaff;
            color: #ffffff;
        }
    </style>
</head>

<body>
    <table>
        <tr class="even0">
            <td class=left>Host</td>
            <td>$(hostname)</td>
        </tr>
        <tr class="odd0">
            <td class=left>Log Date</td>
            <td>$(date -d "yesterday" +"%A %B %d %Y")</td>
        </tr>
        <tr class="even0">
            <td class=left>IP-Address</td>
            <td>$IPV4ADDRESS $IPV6ADDRESS</td>
        </tr>
        <tr>
            <th colspan=2>Service State</th>
        </tr>
        <tr class="even0">
            <td class=left>Postfix Service</td>
            <td>$POSTFIX</td>
        </tr>
        <tr class="odd0">
            <td class=left>Spamassassin Service</td>
            <td>$SPAMASSASSIN</td>
        </tr>
        <tr class="even0">
            <td class=left>ClamAV Service</td>
            <td>$CLAMAV</td>
        </tr>
        <tr class="odd0">
            <td class=left>Dovecot Service</td>
            <td>$DOVECOT</td>
        </tr>
        <tr class="even0">
            <td class=left>OpenDKIM Service</td>
            <td>$OPENDKIM</td>
        </tr>
        <tr>
            <th colspan=2>ClamAV</th>
        </tr>
        <tr class="even0">
            <td class=left>Checked E-Mails with Clean Result</td>
            <td>$CLEANCOUNT</td>
        </tr>
        <tr class="odd0">
            <td class=left>Checked E-Mails with Virus Result</td>
            <td>$INFECTEDCOUNT</td>
        </tr>
        <tr>
            <th colspan=2>IMAP</th>
        </tr>
        <tr class="even0">
            <td class=left>Total IMAP Logins</td>
            <td>$IMAPLOGINCOUNT</td>
        </tr>
        <tr class="odd0">
            <td class=left>IMAP Logins Failed</td>
            <td>$IMAPLOGINFAILCOUNT</td>
        </tr>
        <tr class="even0">
            <td class=left>IMAP Logins using IPV4</td>
            <td>$IMAPIPV4LOGINCOUNT</td>
        </tr>
        <tr class="odd0">
            <td class=left>IMAP Logins using IPV6</td>
            <td>$IMAPIPV6LOGINCOUNT</td>
        </tr>
        <tr class="even0">
            <td class=left>IMAP Logins using WebInterface</td>
            <td>$IMAPWEBLOGINCOUNT</td>
        </tr>
        <tr>
            <th colspan=2>POP3</th>
        </tr>
        <tr class="even0">
            <td class=left>Total POP3 Logins</td>
            <td>$POP3LOGINCOUNT</td>
        </tr>
        <tr class="odd0">
            <td class=left>POP3 Logins Failed</td>
            <td>$POP3LOGINFAILCOUNT</td>
        </tr>
        <tr class="even0">
            <td class=left>POP3 Logins using IPV4</td>
            <td>$POP3IPV4LOGINCOUNT</td>
        </tr>
        <tr class="odd0">
            <td class=left>POP3 Logins using IPV6</td>
            <td>$POP3IPV6LOGINCOUNT</td>
        </tr>
        <tr class="even0">
            <td class=left>POP3 Logins using WebInterface</td>
            <td>$POP3WEBLOGINCOUNT</td>
        </tr>
        <tr>
            <th colspan=2>Outgoing E-Mails</th>
        </tr>
        <tr class="even0">
            <td class=left>Sent E-Mails by Postfix</td>
            <td>$SENTMAILCOUNT</td>
        </tr>
        <tr class="odd0">
            <td class=left>Bounced E-Mails by Reciever</td>
            <td>$BOUNCEDMAILCOUNT</td>
        </tr>
        <tr>
            <th colspan=2>SMTP</th>
        </tr>
        <tr class="even0">
            <td class=left>Total SMTP Incoming Connection Count</td>
            <td>$CONNECTIONCOUNT</td>
        </tr>
        <tr class="odd0">
            <td class=left>SMTP Incoming Connections using IPV4</td>
            <td>$CONNECTIONIPV4COUNT</td>
        </tr>
        <tr class="even0">
            <td class=left>SMTP Incoming Connections using IPV6</td>
            <td>$CONNECTIONIPV6COUNT</td>
        </tr>
        <tr class="odd0">
            <td class=left>Relay Access Denied</td>
            <td>$RELAYDENIED</td>
        </tr>
        <tr class="even0">
            <td class=left>Postfix can not find a PTR Record</td>
            <td>$NOPTRCOUNT</td>
        </tr>
        <tr>
            <th colspan=2>Blackhole</th>
        </tr>
        <tr class="even0">
            <td class=left>Hosts Blocked by Blackhole DNS</td>
            <td>$BLACKHOLEDMAILCOUNT</td>
        </tr>
        <tr>
            <th colspan=2>Spamassassin</th>
        </tr>
        <tr class="even0">
            <td class=left>Tested E-Mails by Spamassassin</td>
            <td>$TESTEDMAILCOUNT</td>
        </tr>
        <tr class="odd0">
            <td class=left>E-Mails rejected as SPAM</td>
            <td>$SPAMCOUNT</td>
        </tr>
        <tr class="even0">
            <td class=left>Clean E-Mails</td>
            <td>$HAMCOUNT</td>
        </tr>
    </table>
</body>
TEMPLATE
)