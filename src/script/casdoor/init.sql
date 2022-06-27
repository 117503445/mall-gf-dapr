-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主机： db:3306
-- 生成日期： 2022-06-27 17:32:28
-- 服务器版本： 8.0.27
-- PHP 版本： 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `casdoor`
--

-- --------------------------------------------------------

--
-- 表的结构 `application`
--

CREATE TABLE `application` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `homepage_url` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `cert` varchar(100) DEFAULT NULL,
  `enable_password` tinyint(1) DEFAULT NULL,
  `enable_sign_up` tinyint(1) DEFAULT NULL,
  `enable_signin_session` tinyint(1) DEFAULT NULL,
  `enable_code_signin` tinyint(1) DEFAULT NULL,
  `providers` mediumtext,
  `signup_items` varchar(1000) DEFAULT NULL,
  `grant_types` varchar(1000) DEFAULT NULL,
  `client_id` varchar(100) DEFAULT NULL,
  `client_secret` varchar(100) DEFAULT NULL,
  `redirect_uris` varchar(1000) DEFAULT NULL,
  `token_format` varchar(100) DEFAULT NULL,
  `expire_in_hours` int DEFAULT NULL,
  `refresh_expire_in_hours` int DEFAULT NULL,
  `signup_url` varchar(200) DEFAULT NULL,
  `signin_url` varchar(200) DEFAULT NULL,
  `forget_url` varchar(200) DEFAULT NULL,
  `affiliation_url` varchar(100) DEFAULT NULL,
  `terms_of_use` varchar(100) DEFAULT NULL,
  `signup_html` mediumtext,
  `signin_html` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `application`
--

INSERT INTO `application` (`owner`, `name`, `created_time`, `display_name`, `logo`, `homepage_url`, `description`, `organization`, `cert`, `enable_password`, `enable_sign_up`, `enable_signin_session`, `enable_code_signin`, `providers`, `signup_items`, `grant_types`, `client_id`, `client_secret`, `redirect_uris`, `token_format`, `expire_in_hours`, `refresh_expire_in_hours`, `signup_url`, `signin_url`, `forget_url`, `affiliation_url`, `terms_of_use`, `signup_html`, `signin_html`) VALUES
('admin', 'app-built-in', '2022-06-27T17:28:58Z', 'Casdoor', 'https://cdn.casbin.com/logo/logo_1024x256.png', 'https://casdoor.org', '', 'built-in', 'cert-built-in', 1, 1, 0, 0, '[{\"name\":\"provider_captcha_default\",\"canSignUp\":false,\"canSignIn\":false,\"canUnlink\":false,\"prompted\":false,\"alertType\":\"None\",\"provider\":null}]', '[{\"name\":\"ID\",\"visible\":false,\"required\":true,\"prompted\":false,\"rule\":\"Random\"},{\"name\":\"Username\",\"visible\":true,\"required\":true,\"prompted\":false,\"rule\":\"None\"},{\"name\":\"Display name\",\"visible\":true,\"required\":true,\"prompted\":false,\"rule\":\"None\"},{\"name\":\"Password\",\"visible\":true,\"required\":true,\"prompted\":false,\"rule\":\"None\"},{\"name\":\"Confirm password\",\"visible\":true,\"required\":true,\"prompted\":false,\"rule\":\"None\"},{\"name\":\"Email\",\"visible\":true,\"required\":true,\"prompted\":false,\"rule\":\"Normal\"},{\"name\":\"Phone\",\"visible\":true,\"required\":true,\"prompted\":false,\"rule\":\"None\"},{\"name\":\"Agreement\",\"visible\":true,\"required\":true,\"prompted\":false,\"rule\":\"None\"}]', 'null', 'f550e3be0ff6c7bd794a', 'c90615a948389a33b70fd0b6a2485b9bb011609c', '[]', '', 168, 0, '', '', '', '', '', '', ''),
('admin', 'mall', '2022-06-28T01:32:19+08:00', 'mall', 'https://cdn.casdoor.com/logo/casdoor-logo_1185x256.png', '', '', 'mall', 'cert-built-in', 1, 1, 0, 0, '[{\"name\":\"provider_captcha_default\",\"canSignUp\":false,\"canSignIn\":false,\"canUnlink\":false,\"prompted\":false,\"alertType\":\"None\",\"provider\":null}]', '[{\"name\":\"ID\",\"visible\":false,\"required\":true,\"prompted\":false,\"rule\":\"Random\"},{\"name\":\"Username\",\"visible\":true,\"required\":true,\"prompted\":false,\"rule\":\"None\"},{\"name\":\"Display name\",\"visible\":false,\"required\":false,\"prompted\":false,\"rule\":\"None\"},{\"name\":\"Password\",\"visible\":true,\"required\":true,\"prompted\":false,\"rule\":\"None\"},{\"name\":\"Confirm password\",\"visible\":true,\"required\":true,\"prompted\":false,\"rule\":\"None\"},{\"name\":\"Email\",\"visible\":false,\"required\":false,\"prompted\":false,\"rule\":\"Normal\"},{\"name\":\"Phone\",\"visible\":false,\"required\":false,\"prompted\":false,\"rule\":\"None\"},{\"name\":\"Agreement\",\"visible\":false,\"required\":false,\"prompted\":false,\"rule\":\"None\"}]', '[\"authorization_code\"]', '325462fc3558deaf360b', '8c1a94f8d0f58d77a37beff8b7a54f9d58a53bf9', '[\"http://localhost:9000/callback\"]', 'JWT', 168, 0, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `casbin_rule`
--

CREATE TABLE `casbin_rule` (
  `p_type` varchar(100) NOT NULL DEFAULT '',
  `v0` varchar(100) NOT NULL DEFAULT '',
  `v1` varchar(100) NOT NULL DEFAULT '',
  `v2` varchar(100) NOT NULL DEFAULT '',
  `v3` varchar(100) NOT NULL DEFAULT '',
  `v4` varchar(100) NOT NULL DEFAULT '',
  `v5` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `casbin_rule`
--

INSERT INTO `casbin_rule` (`p_type`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`) VALUES
('p', 'built-in', '*', '*', '*', '*', '*'),
('p', 'app', '*', '*', '*', '*', '*'),
('p', '*', '*', 'POST', '/api/signup', '*', '*'),
('p', '*', '*', 'POST', '/api/get-email-and-phone', '*', '*'),
('p', '*', '*', 'POST', '/api/login', '*', '*'),
('p', '*', '*', 'GET', '/api/get-app-login', '*', '*'),
('p', '*', '*', 'POST', '/api/logout', '*', '*'),
('p', '*', '*', 'GET', '/api/get-account', '*', '*'),
('p', '*', '*', 'GET', '/api/userinfo', '*', '*'),
('p', '*', '*', '*', '/api/login/oauth', '*', '*'),
('p', '*', '*', 'GET', '/api/get-application', '*', '*'),
('p', '*', '*', 'GET', '/api/get-applications', '*', '*'),
('p', '*', '*', 'GET', '/api/get-user', '*', '*'),
('p', '*', '*', 'GET', '/api/get-user-application', '*', '*'),
('p', '*', '*', 'GET', '/api/get-resources', '*', '*'),
('p', '*', '*', 'GET', '/api/get-product', '*', '*'),
('p', '*', '*', 'POST', '/api/buy-product', '*', '*'),
('p', '*', '*', 'GET', '/api/get-payment', '*', '*'),
('p', '*', '*', 'POST', '/api/update-payment', '*', '*'),
('p', '*', '*', 'POST', '/api/invoice-payment', '*', '*'),
('p', '*', '*', 'GET', '/api/get-providers', '*', '*'),
('p', '*', '*', 'POST', '/api/unlink', '*', '*'),
('p', '*', '*', 'POST', '/api/set-password', '*', '*'),
('p', '*', '*', 'POST', '/api/send-verification-code', '*', '*'),
('p', '*', '*', 'GET', '/api/get-captcha', '*', '*'),
('p', '*', '*', 'POST', '/api/verify-captcha', '*', '*'),
('p', '*', '*', 'POST', '/api/reset-email-or-phone', '*', '*'),
('p', '*', '*', 'POST', '/api/upload-resource', '*', '*'),
('p', '*', '*', 'GET', '/.well-known/openid-configuration', '*', '*'),
('p', '*', '*', '*', '/.well-known/jwks', '*', '*'),
('p', '*', '*', 'GET', '/api/get-saml-login', '*', '*'),
('p', '*', '*', 'POST', '/api/acs', '*', '*'),
('p', '*', '*', 'GET', '/api/saml/metadata', '*', '*'),
('p', '*', '*', '*', '/cas', '*', '*');

-- --------------------------------------------------------

--
-- 表的结构 `cert`
--

CREATE TABLE `cert` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `crypto_algorithm` varchar(100) DEFAULT NULL,
  `bit_size` int DEFAULT NULL,
  `expire_in_years` int DEFAULT NULL,
  `public_key` mediumtext,
  `private_key` mediumtext,
  `authority_public_key` mediumtext,
  `authority_root_public_key` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `cert`
--

INSERT INTO `cert` (`owner`, `name`, `created_time`, `display_name`, `scope`, `type`, `crypto_algorithm`, `bit_size`, `expire_in_years`, `public_key`, `private_key`, `authority_public_key`, `authority_root_public_key`) VALUES
('admin', 'cert-built-in', '2022-06-27T17:28:58Z', 'Built-in Cert', 'JWT', 'x509', 'RS256', 4096, 20, '-----BEGIN CERTIFICATE-----\nMIIE+TCCAuGgAwIBAgIDAeJAMA0GCSqGSIb3DQEBCwUAMDYxHTAbBgNVBAoTFENh\nc2Rvb3IgT3JnYW5pemF0aW9uMRUwEwYDVQQDEwxDYXNkb29yIENlcnQwHhcNMjEx\nMDE1MDgxMTUyWhcNNDExMDE1MDgxMTUyWjA2MR0wGwYDVQQKExRDYXNkb29yIE9y\nZ2FuaXphdGlvbjEVMBMGA1UEAxMMQ2FzZG9vciBDZXJ0MIICIjANBgkqhkiG9w0B\nAQEFAAOCAg8AMIICCgKCAgEAsInpb5E1/ym0f1RfSDSSE8IR7y+lw+RJjI74e5ej\nrq4b8zMYk7HeHCyZr/hmNEwEVXnhXu1P0mBeQ5ypp/QGo8vgEmjAETNmzkI1NjOQ\nCjCYwUrasO/f/MnI1C0j13vx6mV1kHZjSrKsMhYY1vaxTEP3+VB8Hjg3MHFWrb07\nuvFMCJe5W8+0rKErZCKTR8+9VB3janeBz//zQePFVh79bFZate/hLirPK0Go9P1g\nOvwIoC1A3sarHTP4Qm/LQRt0rHqZFybdySpyWAQvhNaDFE7mTstRSBb/wUjNCUBD\nPTSLVjC04WllSf6Nkfx0Z7KvmbPstSj+btvcqsvRAGtvdsB9h62Kptjs1Yn7GAuo\nI3qt/4zoKbiURYxkQJXIvwCQsEftUuk5ew5zuPSlDRLoLByQTLbx0JqLAFNfW3g/\npzSDjgd/60d6HTmvbZni4SmjdyFhXCDb1Kn7N+xTojnfaNkwep2REV+RMc0fx4Gu\nhRsnLsmkmUDeyIZ9aBL9oj11YEQfM2JZEq+RVtUx+wB4y8K/tD1bcY+IfnG5rBpw\nIDpS262boq4SRSvb3Z7bB0w4ZxvOfJ/1VLoRftjPbLIf0bhfr/AeZMHpIKOXvfz4\nyE+hqzi68wdF0VR9xYc/RbSAf7323OsjYnjjEgInUtRohnRgCpjIk/Mt2Kt84Kb0\nwn8CAwEAAaMQMA4wDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAn2lf\nDKkLX+F1vKRO/5gJ+Plr8P5NKuQkmwH97b8CS2gS1phDyNgIc4/LSdzuf4Awe6ve\nC06lVdWSIis8UPUPdjmT2uMPSNjwLxG3QsrimMURNwFlLTfRem/heJe0Zgur9J1M\n8haawdSdJjH2RgmFoDeE2r8NVRfhbR8KnCO1ddTJKuS1N0/irHz21W4jt4rxzCvl\n2nR42Fybap3O/g2JXMhNNROwZmNjgpsF7XVENCSuFO1jTywLaqjuXCg54IL7XVLG\nomKNNNcc8h1FCeKj/nnbGMhodnFWKDTsJcbNmcOPNHo6ixzqMy/Hqc+mWYv7maAG\nJtevs3qgMZ8F9Qzr3HpUc6R3ZYYWDY/xxPisuKftOPZgtH979XC4mdf0WPnOBLqL\n2DJ1zaBmjiGJolvb7XNVKcUfDXYw85ZTZQ5b9clI4e+6bmyWqQItlwt+Ati/uFEV\nXzCj70B4lALX6xau1kLEpV9O1GERizYRz5P9NJNA7KoO5AVMp9w0DQTkt+LbXnZE\nHHnWKy8xHQKZF9sR7YBPGLs/Ac6tviv5Ua15OgJ/8dLRZ/veyFfGo2yZsI+hKVU5\nnCCJHBcAyFnm1hdvdwEdH33jDBjNB6ciotJZrf/3VYaIWSalADosHAgMWfXuWP+h\n8XKXmzlxuHbTMQYtZPDgspS5aK+S4Q9wb8RRAYo=\n-----END CERTIFICATE-----\n', '-----BEGIN PRIVATE KEY-----\nMIIJKQIBAAKCAgEAsInpb5E1/ym0f1RfSDSSE8IR7y+lw+RJjI74e5ejrq4b8zMY\nk7HeHCyZr/hmNEwEVXnhXu1P0mBeQ5ypp/QGo8vgEmjAETNmzkI1NjOQCjCYwUra\nsO/f/MnI1C0j13vx6mV1kHZjSrKsMhYY1vaxTEP3+VB8Hjg3MHFWrb07uvFMCJe5\nW8+0rKErZCKTR8+9VB3janeBz//zQePFVh79bFZate/hLirPK0Go9P1gOvwIoC1A\n3sarHTP4Qm/LQRt0rHqZFybdySpyWAQvhNaDFE7mTstRSBb/wUjNCUBDPTSLVjC0\n4WllSf6Nkfx0Z7KvmbPstSj+btvcqsvRAGtvdsB9h62Kptjs1Yn7GAuoI3qt/4zo\nKbiURYxkQJXIvwCQsEftUuk5ew5zuPSlDRLoLByQTLbx0JqLAFNfW3g/pzSDjgd/\n60d6HTmvbZni4SmjdyFhXCDb1Kn7N+xTojnfaNkwep2REV+RMc0fx4GuhRsnLsmk\nmUDeyIZ9aBL9oj11YEQfM2JZEq+RVtUx+wB4y8K/tD1bcY+IfnG5rBpwIDpS262b\noq4SRSvb3Z7bB0w4ZxvOfJ/1VLoRftjPbLIf0bhfr/AeZMHpIKOXvfz4yE+hqzi6\n8wdF0VR9xYc/RbSAf7323OsjYnjjEgInUtRohnRgCpjIk/Mt2Kt84Kb0wn8CAwEA\nAQKCAgAHP7JxHVJNRuYdcFZ1PYtd+lMIMjmpQH9woRI86O4UpxuIselpbx1CpOYu\nnpF7xj9LTzTc0/u6FLDqL82bkt6O7TknKFvymNy4zWkn75gTgwlSroMqTr8wvwxb\nAft9xp4ZVM8t/l53W7zMVbHxabHAAu50s0RVbVN+zriTa7i/JVdM5wX6ah3uFLQW\naYEIqtQIVy3WWk/fPZA8fWDF94HKaAVTgSUK40EccpbAcIL6CQ1FnnYSb6/pBBBG\nkhaTdtAkoOgWVkc3EmIdkRZuaux48gBs7dZJkoAv7JBWt+fK5JRwFpHmy5AYKLah\nbu9Mrr6dHhEzIxrHbIm0DahoTwEFmso8kbU26caGEhufo4YiMk+B4bE6QsmNsNR9\nMsau8qkSLprYo6Mrj1Q7y1q3rShf8SuZBa3Kxk0hBy8Zs9TjkJ+Dbtq2zakQWzDG\nJLEttbGgdeYUMS2ycC/FUYUN/YPCdn769kw7lmOR2Kl56wpbFYwR9JYgynQqb3jd\n4AORgsR3ADaxVDXw1ol7Bcie334WusvxNCJVRuzBY/DK0/W7ijxjJvdXevHxGrhe\n1Gc+FkKebfiNfq6Dzdlkx66N80nyZuZvyrnRiavm9bVcrarb5XhS5ICfEOHOw0gH\n5GdesqMuqTSOeveD1RUncF1CWWMvvPeEushW9jbL3BBh4wfLsQKCAQEAy4x+c+F8\nIcbaKfssrhPRMfYUjWee39tOvHDtxM/3sx60ysrEUx1LsjagQz7noLljF7XfJ0H+\nvc0G6A0ojwA6J+QdoEf8fevO4t56uMae3dFWP4J000vHCIvrgAo9GC2HOc940/Yn\n6EqjWYqc2AXu156RA3P/XetgsxivVCFlGzPxFylbqzKB71Yb9hc5zz26G3K8+FVZ\ndp+DYFjHBo6LRuVwXdXKi/QgUXv7iFR7zFqvkGhm5ZqvcKXfqWSpx4H71kQAUTQE\ncJ8lvgquFTouViopOJD6DBII0PJ/TBtg5g9a+jsnXxcpCjj9XychGsj1dTzSDmQd\nha/rKyN4dNHy2QKCAQEA3gekrROPdglcooamedrvlwpIrxryKI5MrhEAgIBeJidp\n98HhNcJ08wra5XuMS6ZC7R0xOKikSQLp4giT22W59lq/nPQ7PN5PdN2RzOlrmHcS\nkAGF3Qg9x0cCelSqzyTl4RKrefYPLJUElVLmTxEgBiis7s2gxpsJ3q92WtWf8aU/\n7Pc3ztAV/DqzeUCOACVz74l4QuE9LJlro0shs0TaHWM0AZ9eVk4V8xBM8VJ2DAX8\nvpTYcNDxjEeByEMgWdXlyOndvolRDMCMrQMVg+ZoeX5SpDe2b6fgw5ZjZSngnrJ4\nifesFEbwmXmb3XDDNyWADG5/xAkpCGPCa34JmG7ZFwKCAQEAlsrrNx/ZnRA6uRUZ\nwZBuzut1yFf2i/JlPxcOHlrPLwRVfVJ/5O70D/+F9KtaX2hXr84NloC+no+QSULO\nRDov2zOUexQ5SnPyHYIiOlbyhHO7yGr17z7ZIUy+12k+X3YDEuHPqn9WizEYGJKm\npSaoDVasKXm6ujJQvf1Qjiv7Qg7V0YnTHl3ZgpwxNLt6GTyqbgEvW22nTEjZw/ug\n3gulxIzfFLT4S3w8oQEPk6y61eZs37doWzqgM/y+WDh5ypJSJibUcVPu4hwUkthI\npPMoNq8fQIeupliJ7XlostIpk+XWSUCfZ0O6JJeZpO9RCA3OQd8f4odqk4qC1r99\nUlXi6QKCAQEApSF+IpNXsWxJDz+h9SMV6nnlkQYzcGJVOWi/vNK8MxhBQdlajEcx\n/8jlAKQgterT/9IkV4Vlmj+mf0vt29EOu+DGfg9PN3gIFFzuIT7BnUWB8sSPMNL+\nT4XKm/z4hNNmfT0Ld8u/gWLbY8uiKtALx0jdRUZ9+vg4IPzSw7/6ExjaMH21bgVp\nNIzcCqQueIFidpcBcIxgmRkJ6wrn55KfvheYCFTlLr8op/xJnXm8/jg9v+ioCU/9\nNl3AcpcqKmZhXkpBd4JdW2Shu9N9XvowXZvMDwK4ltZ+3jiteAHrY1xNNh+URgh0\nzVCa0dkZ95vWXmiYcc52TB0V7ihxLoPSxQKCAQAwP3D0JyRvWepLasQd0NQeVt0q\n0/ExXjq+qmIeT6q2GHhgZJjm6Ysovr+cEdZC6sV6JiqW9NhHfTYO4EkJetzlHMt5\njseFq14QMAgVuo7cYLkONgGxpYGo1DaddxlkMKpmpsTeFsvRyCnyWpHVG/sA1eVp\ncaanw6S2tnhxx2Yq78bv8Vj8jA0k8j34j2bMBFcuIEsaQ2Sdfw/1TSkKGB2k2crP\ntxbblVR4BN1DC8wpK/M67B097uMUmWe1UQxsjc0P9S/rlWUhKyBEeLOV3/yRPDSM\nGMRXh780wMWlS34RUYxxv6dtWB9KI7++XRrnrBPrZa0xUUOpSYILm7OLeuQ5\n-----END PRIVATE KEY-----\n', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ldap`
--

CREATE TABLE `ldap` (
  `id` varchar(100) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `server_name` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `passwd` varchar(100) DEFAULT NULL,
  `base_dn` varchar(100) DEFAULT NULL,
  `auto_sync` int DEFAULT NULL,
  `last_sync` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `ldap`
--

INSERT INTO `ldap` (`id`, `owner`, `created_time`, `server_name`, `host`, `port`, `admin`, `passwd`, `base_dn`, `auto_sync`, `last_sync`) VALUES
('ldap-built-in', 'built-in', '2022-06-27T17:28:58Z', 'BuildIn LDAP Server', 'example.com', 389, 'cn=buildin,dc=example,dc=com', '123', 'ou=BuildIn,dc=example,dc=com', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `model`
--

CREATE TABLE `model` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `model_text` mediumtext,
  `is_enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `organization`
--

CREATE TABLE `organization` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `website_url` varchar(100) DEFAULT NULL,
  `favicon` varchar(100) DEFAULT NULL,
  `password_type` varchar(100) DEFAULT NULL,
  `password_salt` varchar(100) DEFAULT NULL,
  `phone_prefix` varchar(10) DEFAULT NULL,
  `default_avatar` varchar(100) DEFAULT NULL,
  `tags` mediumtext,
  `master_password` varchar(100) DEFAULT NULL,
  `enable_soft_deletion` tinyint(1) DEFAULT NULL,
  `is_profile_public` tinyint(1) DEFAULT NULL,
  `account_items` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `organization`
--

INSERT INTO `organization` (`owner`, `name`, `created_time`, `display_name`, `website_url`, `favicon`, `password_type`, `password_salt`, `phone_prefix`, `default_avatar`, `tags`, `master_password`, `enable_soft_deletion`, `is_profile_public`, `account_items`) VALUES
('admin', 'built-in', '2022-06-27T17:28:58Z', 'Built-in Organization', 'https://example.com', 'https://cdn.casbin.com/static/favicon.ico', 'plain', '', '86', 'https://casbin.org/img/casbin.svg', '[]', '', 0, 0, '[{\"name\":\"Organization\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Admin\"},{\"name\":\"ID\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Immutable\"},{\"name\":\"Name\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Admin\"},{\"name\":\"Display name\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Avatar\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"User type\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Admin\"},{\"name\":\"Password\",\"visible\":true,\"viewRule\":\"Self\",\"modifyRule\":\"Self\"},{\"name\":\"Email\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Phone\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Country/Region\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Location\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Affiliation\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Title\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Homepage\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Bio\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Tag\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Admin\"},{\"name\":\"Signup application\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Admin\"},{\"name\":\"3rd-party logins\",\"visible\":true,\"viewRule\":\"Self\",\"modifyRule\":\"Self\"},{\"name\":\"Properties\",\"visible\":false,\"viewRule\":\"Admin\",\"modifyRule\":\"Admin\"},{\"name\":\"Is admin\",\"visible\":true,\"viewRule\":\"Admin\",\"modifyRule\":\"Admin\"},{\"name\":\"Is global admin\",\"visible\":true,\"viewRule\":\"Admin\",\"modifyRule\":\"Admin\"},{\"name\":\"Is forbidden\",\"visible\":true,\"viewRule\":\"Admin\",\"modifyRule\":\"Admin\"},{\"name\":\"Is deleted\",\"visible\":true,\"viewRule\":\"Admin\",\"modifyRule\":\"Admin\"}]'),
('admin', 'mall', '2022-06-28T01:30:24+08:00', 'mall', 'https://door.casdoor.com', 'https://cdn.casdoor.com/static/favicon.png', 'bcrypt', '', '86', 'https://casbin.org/img/casbin.svg', '[]', '', 0, 1, '[{\"name\":\"Organization\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Admin\"},{\"name\":\"ID\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Immutable\"},{\"name\":\"Name\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Admin\"},{\"name\":\"Display name\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Avatar\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"User type\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Admin\"},{\"name\":\"Password\",\"visible\":true,\"viewRule\":\"Self\",\"modifyRule\":\"Self\"},{\"name\":\"Email\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Phone\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Country/Region\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Location\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Affiliation\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Title\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Homepage\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Bio\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Self\"},{\"name\":\"Tag\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Admin\"},{\"name\":\"Signup application\",\"visible\":true,\"viewRule\":\"Public\",\"modifyRule\":\"Admin\"},{\"name\":\"3rd-party logins\",\"visible\":true,\"viewRule\":\"Self\",\"modifyRule\":\"Self\"},{\"name\":\"Properties\",\"visible\":false,\"viewRule\":\"Admin\",\"modifyRule\":\"Admin\"},{\"name\":\"Is admin\",\"visible\":true,\"viewRule\":\"Admin\",\"modifyRule\":\"Admin\"},{\"name\":\"Is global admin\",\"visible\":true,\"viewRule\":\"Admin\",\"modifyRule\":\"Admin\"},{\"name\":\"Is forbidden\",\"visible\":true,\"viewRule\":\"Admin\",\"modifyRule\":\"Admin\"},{\"name\":\"Is deleted\",\"visible\":true,\"viewRule\":\"Admin\",\"modifyRule\":\"Admin\"}]');

-- --------------------------------------------------------

--
-- 表的结构 `payment`
--

CREATE TABLE `payment` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_display_name` varchar(100) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pay_url` varchar(2000) DEFAULT NULL,
  `return_url` varchar(1000) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `person_name` varchar(100) DEFAULT NULL,
  `person_id_card` varchar(100) DEFAULT NULL,
  `person_email` varchar(100) DEFAULT NULL,
  `person_phone` varchar(100) DEFAULT NULL,
  `invoice_type` varchar(100) DEFAULT NULL,
  `invoice_title` varchar(100) DEFAULT NULL,
  `invoice_tax_id` varchar(100) DEFAULT NULL,
  `invoice_remark` varchar(100) DEFAULT NULL,
  `invoice_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `permission`
--

CREATE TABLE `permission` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `users` mediumtext,
  `roles` mediumtext,
  `model` varchar(100) DEFAULT NULL,
  `resource_type` varchar(100) DEFAULT NULL,
  `resources` mediumtext,
  `actions` mediumtext,
  `effect` varchar(100) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `sold` int DEFAULT NULL,
  `providers` varchar(100) DEFAULT NULL,
  `return_url` varchar(1000) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `provider`
--

CREATE TABLE `provider` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `sub_type` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `client_id` varchar(100) DEFAULT NULL,
  `client_secret` varchar(2000) DEFAULT NULL,
  `client_id2` varchar(100) DEFAULT NULL,
  `client_secret2` varchar(100) DEFAULT NULL,
  `cert` varchar(100) DEFAULT NULL,
  `custom_auth_url` varchar(200) DEFAULT NULL,
  `custom_scope` varchar(200) DEFAULT NULL,
  `custom_token_url` varchar(200) DEFAULT NULL,
  `custom_user_info_url` varchar(200) DEFAULT NULL,
  `custom_logo` varchar(200) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `region_id` varchar(100) DEFAULT NULL,
  `sign_name` varchar(100) DEFAULT NULL,
  `template_code` varchar(100) DEFAULT NULL,
  `app_id` varchar(100) DEFAULT NULL,
  `endpoint` varchar(1000) DEFAULT NULL,
  `intranet_endpoint` varchar(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `bucket` varchar(100) DEFAULT NULL,
  `metadata` mediumtext,
  `id_p` mediumtext,
  `issuer_url` varchar(100) DEFAULT NULL,
  `enable_sign_authn_request` tinyint(1) DEFAULT NULL,
  `provider_url` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `provider`
--

INSERT INTO `provider` (`owner`, `name`, `created_time`, `display_name`, `category`, `type`, `sub_type`, `method`, `client_id`, `client_secret`, `client_id2`, `client_secret2`, `cert`, `custom_auth_url`, `custom_scope`, `custom_token_url`, `custom_user_info_url`, `custom_logo`, `host`, `port`, `title`, `content`, `region_id`, `sign_name`, `template_code`, `app_id`, `endpoint`, `intranet_endpoint`, `domain`, `bucket`, `metadata`, `id_p`, `issuer_url`, `enable_sign_authn_request`, `provider_url`) VALUES
('admin', 'provider_captcha_default', '2022-06-27T17:28:58Z', 'Captcha Default', 'Captcha', 'Default', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `record`
--

CREATE TABLE `record` (
  `id` int NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `client_ip` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `request_uri` varchar(1000) DEFAULT NULL,
  `action` varchar(1000) DEFAULT NULL,
  `is_triggered` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `record`
--

INSERT INTO `record` (`id`, `owner`, `name`, `created_time`, `organization`, `client_ip`, `user`, `method`, `request_uri`, `action`, `is_triggered`) VALUES
(1, 'built-in', '17ec7350-7dad-4e1e-bc74-0ec7f9c62ec5', '2022-06-27T17:29:00Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-account', 'get-account', 1),
(2, 'built-in', '233c1cdb-99bd-45f8-92dd-677132631188', '2022-06-27T17:29:00Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-applications?organization=built-in&owner=admin', 'get-applications', 1),
(3, 'built-in', 'aeec26fd-5711-4238-b33f-b6e090ac5e9f', '2022-06-27T17:29:10Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-organizations?field=&owner=admin&p=1&pageSize=10&sortField=&sortOrder=&value=', 'get-organizations', 1),
(4, 'built-in', 'e9da60e9-d404-4a33-bc3e-06adb86c08b9', '2022-06-27T17:29:12Z', 'built-in', '172.21.0.1', 'admin', 'POST', '/api/add-organization', 'add-organization', 1),
(5, 'built-in', '9a430e69-ec21-45bb-ab93-2dfb64df1ee7', '2022-06-27T17:29:12Z', 'built-in', '172.21.0.1', 'admin', 'POST', '/api/get-ldaps?owner=organization_koge78', 'get-ldaps', 1),
(6, 'built-in', '90b25b62-118f-4653-a6e7-bc4578cad57d', '2022-06-27T17:29:12Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-organization?id=admin/organization_koge78', 'get-organization', 1),
(7, 'built-in', '21adbe2e-06be-4a6a-990b-0c408be6a89d', '2022-06-27T17:30:27Z', 'built-in', '172.21.0.1', 'admin', 'POST', '/api/update-organization?id=admin/organization_koge78', 'update-organization', 1),
(8, 'built-in', 'f0ab8694-92b0-4a16-aa24-262ffb57782a', '2022-06-27T17:30:27Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-organizations?field=&owner=admin&p=1&pageSize=10&sortField=&sortOrder=&value=', 'get-organizations', 1),
(9, 'built-in', 'bef5259b-c4df-4074-a62a-20065b850cab', '2022-06-27T17:30:32Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-organization?id=admin/mall', 'get-organization', 1),
(10, 'built-in', '0058961b-86f1-4a68-914b-9369658da859', '2022-06-27T17:30:32Z', 'built-in', '172.21.0.1', 'admin', 'POST', '/api/get-ldaps?owner=mall', 'get-ldaps', 1),
(11, 'built-in', '4e63c127-8354-4309-a394-7834b46b5f92', '2022-06-27T17:30:41Z', 'built-in', '172.21.0.1', 'admin', 'POST', '/api/update-organization?id=admin/mall', 'update-organization', 1),
(12, 'built-in', '7093b42b-9c02-4f37-994b-aee04638714f', '2022-06-27T17:30:41Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-organizations?field=&owner=admin&p=1&pageSize=10&sortField=&sortOrder=&value=', 'get-organizations', 1),
(13, 'built-in', '12c8865a-e753-4fe6-8216-4db2caff38aa', '2022-06-27T17:30:57Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-global-users?field=&p=1&pageSize=10&sortField=&sortOrder=&value=', 'get-global-users', 1),
(14, 'built-in', '9edd8dfa-b590-4d03-9bb4-830e23df6cea', '2022-06-27T17:30:58Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-organizations?field=&owner=admin&p=1&pageSize=10&sortField=&sortOrder=&value=', 'get-organizations', 1),
(15, 'built-in', '797cfe28-5467-47f6-a688-b7e020d8203b', '2022-06-27T17:30:59Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-global-users?field=&p=1&pageSize=10&sortField=&sortOrder=&value=', 'get-global-users', 1),
(16, 'built-in', 'e5da18c8-e21c-4731-90bb-f7bb22d9794e', '2022-06-27T17:31:00Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-organizations?field=&owner=admin&p=1&pageSize=10&sortField=&sortOrder=&value=', 'get-organizations', 1),
(17, 'built-in', '457e47d0-151d-48c9-bfc7-689e28850b67', '2022-06-27T17:31:00Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-applications?organization=built-in&owner=admin', 'get-applications', 1),
(18, 'built-in', '52b5cfd6-8baf-4d0b-929b-fb879cbdb2a3', '2022-06-27T17:31:03Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-applications?field=&owner=admin&p=1&pageSize=10&sortField=&sortOrder=&value=', 'get-applications', 1),
(19, 'built-in', 'e5a02e9c-eeff-49e1-8cb2-b50473285861', '2022-06-27T17:31:04Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-applications?organization=built-in&owner=admin', 'get-applications', 1),
(20, 'built-in', '1f555340-f8fe-4434-8074-93edd23c09c0', '2022-06-27T17:31:06Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-applications?field=&owner=admin&p=1&pageSize=10&sortField=&sortOrder=&value=', 'get-applications', 1),
(21, 'built-in', '233f54fc-b093-4ff3-9cd0-f5af66e6c39d', '2022-06-27T17:31:07Z', 'built-in', '172.21.0.1', 'admin', 'POST', '/api/add-application', 'add-application', 1),
(22, 'built-in', '45980839-f175-460f-acc5-9f10eadb3d37', '2022-06-27T17:31:07Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-application?id=admin/application_go4l6u', 'get-application', 1),
(23, 'built-in', '7ec7a297-6738-485b-8aa4-d668b286860c', '2022-06-27T17:31:07Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-organizations?field=&owner=admin&p=&pageSize=&sortField=&sortOrder=&value=', 'get-organizations', 1),
(24, 'built-in', '3f85c96c-3fba-40e7-8352-ec32880721fa', '2022-06-27T17:31:07Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-certs?field=&owner=admin&p=&pageSize=&sortField=&sortOrder=&value=', 'get-certs', 1),
(25, 'built-in', 'b57bba6f-8d52-4d5d-b6a5-83e4bd5ed0ce', '2022-06-27T17:31:07Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-providers?field=&owner=admin&p=&pageSize=&sortField=&sortOrder=&value=', 'get-providers', 1),
(26, 'built-in', 'e5366005-3f42-4324-aeb8-dca101c5ff89', '2022-06-27T17:31:07Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/saml/metadata?application=admin/application_go4l6u', 'saml/metadata', 1),
(27, 'built-in', '4fb1b6ec-17a6-4f10-930e-566c5b46952b', '2022-06-27T17:31:07Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-application?id=admin/app-built-in', 'get-application', 1),
(28, 'built-in', '9f4ae6fd-e1a7-4c92-913f-11a65d62767f', '2022-06-27T17:31:07Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-user?id=built-in/admin', 'get-user', 1),
(29, 'built-in', '28325bcb-a3ec-4a53-8b68-2ae4e3c5b7f0', '2022-06-27T17:32:06Z', 'built-in', '172.21.0.1', 'admin', 'POST', '/api/update-application?id=admin/application_go4l6u', 'update-application', 1),
(30, 'built-in', '702c3ec9-ff9d-413b-982b-01b487e017a0', '2022-06-27T17:32:06Z', 'built-in', '172.21.0.1', 'admin', 'GET', '/api/get-applications?field=&owner=admin&p=1&pageSize=10&sortField=&sortOrder=&value=', 'get-applications', 1);

-- --------------------------------------------------------

--
-- 表的结构 `resource`
--

CREATE TABLE `resource` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `application` varchar(100) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `parent` varchar(100) DEFAULT NULL,
  `file_name` varchar(1000) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `file_format` varchar(100) DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE `role` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `users` mediumtext,
  `roles` mediumtext,
  `is_enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `syncer`
--

CREATE TABLE `syncer` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `database_type` varchar(100) DEFAULT NULL,
  `database` varchar(100) DEFAULT NULL,
  `table` varchar(100) DEFAULT NULL,
  `table_primary_key` varchar(100) DEFAULT NULL,
  `table_columns` mediumtext,
  `affiliation_table` varchar(100) DEFAULT NULL,
  `avatar_base_url` varchar(100) DEFAULT NULL,
  `error_text` mediumtext,
  `sync_interval` int DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `token`
--

CREATE TABLE `token` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `application` varchar(100) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `access_token` mediumtext,
  `refresh_token` mediumtext,
  `expires_in` int DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `token_type` varchar(100) DEFAULT NULL,
  `code_challenge` varchar(100) DEFAULT NULL,
  `code_is_used` tinyint(1) DEFAULT NULL,
  `code_expire_in` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `updated_time` varchar(100) DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `password_salt` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `permanent_avatar` varchar(500) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `address` text,
  `affiliation` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `id_card_type` varchar(100) DEFAULT NULL,
  `id_card` varchar(100) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `education` varchar(100) DEFAULT NULL,
  `score` int DEFAULT NULL,
  `karma` int DEFAULT NULL,
  `ranking` int DEFAULT NULL,
  `is_default_avatar` tinyint(1) DEFAULT NULL,
  `is_online` tinyint(1) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `is_global_admin` tinyint(1) DEFAULT NULL,
  `is_forbidden` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `signup_application` varchar(100) DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `pre_hash` varchar(100) DEFAULT NULL,
  `created_ip` varchar(100) DEFAULT NULL,
  `last_signin_time` varchar(100) DEFAULT NULL,
  `last_signin_ip` varchar(100) DEFAULT NULL,
  `github` varchar(100) DEFAULT NULL,
  `google` varchar(100) DEFAULT NULL,
  `qq` varchar(100) DEFAULT NULL,
  `wechat` varchar(100) DEFAULT NULL,
  `we_chat_union_id` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `dingtalk` varchar(100) DEFAULT NULL,
  `weibo` varchar(100) DEFAULT NULL,
  `gitee` varchar(100) DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  `wecom` varchar(100) DEFAULT NULL,
  `lark` varchar(100) DEFAULT NULL,
  `gitlab` varchar(100) DEFAULT NULL,
  `adfs` varchar(100) DEFAULT NULL,
  `baidu` varchar(100) DEFAULT NULL,
  `alipay` varchar(100) DEFAULT NULL,
  `casdoor` varchar(100) DEFAULT NULL,
  `infoflow` varchar(100) DEFAULT NULL,
  `apple` varchar(100) DEFAULT NULL,
  `azuread` varchar(100) DEFAULT NULL,
  `slack` varchar(100) DEFAULT NULL,
  `steam` varchar(100) DEFAULT NULL,
  `bilibili` varchar(100) DEFAULT NULL,
  `okta` varchar(100) DEFAULT NULL,
  `vachar(100)` varchar(255) DEFAULT NULL,
  `custom` varchar(100) DEFAULT NULL,
  `ldap` varchar(100) DEFAULT NULL,
  `properties` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`owner`, `name`, `created_time`, `updated_time`, `id`, `type`, `password`, `password_salt`, `display_name`, `first_name`, `last_name`, `avatar`, `permanent_avatar`, `email`, `email_verified`, `phone`, `location`, `address`, `affiliation`, `title`, `id_card_type`, `id_card`, `homepage`, `bio`, `tag`, `region`, `language`, `gender`, `birthday`, `education`, `score`, `karma`, `ranking`, `is_default_avatar`, `is_online`, `is_admin`, `is_global_admin`, `is_forbidden`, `is_deleted`, `signup_application`, `hash`, `pre_hash`, `created_ip`, `last_signin_time`, `last_signin_ip`, `github`, `google`, `qq`, `wechat`, `we_chat_union_id`, `facebook`, `dingtalk`, `weibo`, `gitee`, `linkedin`, `wecom`, `lark`, `gitlab`, `adfs`, `baidu`, `alipay`, `casdoor`, `infoflow`, `apple`, `azuread`, `slack`, `steam`, `bilibili`, `okta`, `vachar(100)`, `custom`, `ldap`, `properties`) VALUES
('built-in', 'admin', '2022-06-27T17:28:58Z', '', 'aefd09ca-91ea-4c0a-87d7-bb6423e083d7', 'normal-user', '123', '', 'Admin', '', '', 'https://casbin.org/img/casbin.svg', '', 'admin@example.com', 0, '12345678910', '', '[]', 'Example Inc.', '', '', '', '', '', 'staff', '', '', '', '', '', 2000, 0, 1, 0, 0, 1, 1, 0, 0, 'built-in-app', '', '', '127.0.0.1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '{}');

-- --------------------------------------------------------

--
-- 表的结构 `verification_record`
--

CREATE TABLE `verification_record` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `remote_addr` varchar(100) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `user` varchar(100) NOT NULL,
  `provider` varchar(100) NOT NULL,
  `receiver` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `time` bigint NOT NULL,
  `is_used` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `webhook`
--

CREATE TABLE `webhook` (
  `owner` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_time` varchar(100) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `content_type` varchar(100) DEFAULT NULL,
  `headers` mediumtext,
  `events` varchar(100) DEFAULT NULL,
  `is_user_extended` tinyint(1) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `casbin_rule`
--
ALTER TABLE `casbin_rule`
  ADD KEY `IDX_casbin_rule_v5` (`v5`),
  ADD KEY `IDX_casbin_rule_p_type` (`p_type`),
  ADD KEY `IDX_casbin_rule_v0` (`v0`),
  ADD KEY `IDX_casbin_rule_v1` (`v1`),
  ADD KEY `IDX_casbin_rule_v2` (`v2`),
  ADD KEY `IDX_casbin_rule_v3` (`v3`),
  ADD KEY `IDX_casbin_rule_v4` (`v4`);

--
-- 表的索引 `cert`
--
ALTER TABLE `cert`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `ldap`
--
ALTER TABLE `ldap`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_record_owner` (`owner`),
  ADD KEY `IDX_record_name` (`name`);

--
-- 表的索引 `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `syncer`
--
ALTER TABLE `syncer`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`owner`,`name`),
  ADD KEY `IDX_user_email` (`email`),
  ADD KEY `IDX_user_phone` (`phone`),
  ADD KEY `IDX_user_id_card` (`id_card`),
  ADD KEY `IDX_user_id` (`id`);

--
-- 表的索引 `verification_record`
--
ALTER TABLE `verification_record`
  ADD PRIMARY KEY (`owner`,`name`);

--
-- 表的索引 `webhook`
--
ALTER TABLE `webhook`
  ADD PRIMARY KEY (`owner`,`name`),
  ADD KEY `IDX_webhook_organization` (`organization`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `record`
--
ALTER TABLE `record`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
