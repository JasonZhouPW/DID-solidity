# DID合约接口说明 

### 注册DID

#### 注册自主管理的DID

regIDWithPublicKey

参数：

编号 | 名称 | 类型   | 说明
----|-----|------|-------
 0  | did | string  | 注册的DID
 1  | pubKey | bytes  | 所有者的公钥

调用此接口需提供参数中的公钥对应私钥的签名。注册完成后此公钥即与DID绑定。

event:

event Register(string indexed did);

### 注销DID
#### 注销自主管理的DID

deactivateID

参数：

编号 |  名称 | 类型   | 说明
----|-------|---|-------
 0  |  did | string  | 注册的DID

event:

event Deactivate(string indexed did);

### 授权操作

#### 增加代理人

addController

参数:

| 编号 | 名称 | 类型   | 说明       |
| ---- | ----| --- | ---------- |
| 0    | did | string | DID     |
| 1    | controller | string | 代理控制人 |

用公钥来增加代理人，调用此接口需提供所有者的签名。

event:

event AddController(string indexed did, string controller);

#### 撤销代理人

removeController

参数:

| 编号 | 名称 | 类型   | 说明       |
| ---- | ----|--- | ---------- |
| 0    | did | string | DID     |
| 1    | controller | string | 要移除的代理控制人 |

调用此接口需提供所有者的签名。

event:

event RemoveController(string indexed did, string controller);

### 公钥操作

#### 所有者添加公钥

addKey

参数：

编号 |   名称 | 类型   | 说明
----|--------|---|-------
 0  |  did | string  | DID
 1  |  newPubKey | bytes  | 添加的新公钥
 2  |  pubKeyController | string[]  | 公钥的controller（可选，默认为本ID）（新增）

调用此接口需提供所有者的签名，并通过参数2给出验签公钥。验签公钥必须已绑定到该ID。

event:

event AddKey(string indexed did, bytes pubKey, string[] controller);

#### 所有者废除公钥

deactivateKey

参数：

编号 | 名称 | 类型   | 说明
----|-----|----|-------
 0  |  did | string  | DID
 1  |  pubKey | bytes  | 废除的公钥

调用此接口需提供所有者的签名，并通过参数2给出验签公钥。验签公钥必须已绑定到该ID。

event:

event DeactivateKey(string indexed did, bytes pubKey);

### 认证公钥操作

#### 添加新认证公钥

addNewAuthKey

参数：

编号 |   名称 |  类型   | 说明
----|-------| ---|-------
 0  |  did |  string | DID
 1  |  pubKey | bytes  | 公钥
 2  | controller | string[] | 公钥控制人

新公钥成功添加后，会自动分配一个公钥ID。

event:

event AddNewAuthKey(string indexed did, bytes pubKey, string[] controller);

#### 添加新认证公钥

addNewAuthKeyByController

参数：

| 编号 |  名称 | 类型   | 说明       |
| ---- | ------| --- | ---------- |
| 0    | did | string | DID     |
| 1  |  pubKey | bytes  | 公钥 |
| 2  | controller | string[] | 公钥控制人 |
| 3    | controllerSigner | string | 签名控制人 |

新公钥成功添加后，会自动分配一个公钥编号。

event:

event AddNewAuthKey(string indexed did, bytes pubKey, string[] controller);

#### 指定认证公钥

setAuthKey

参数：

| 编号 | 名称 | 类型   | 说明       |
| ---- | -----| --- | ---------- |
| 0    | did | string | DID     |
| 1    | pubKey | bytes | 指定的公钥 |

使公钥列表里的一个pubkey具有权限。

event:

event SetAuthKey(string indexed did, bytes pubKey);

#### 指定认证公钥

setAuthKeyByController

参数：

| 编号 | 名称 |  类型   | 说明       |
| ---- | ------| --- | ---------- |
| 0    | did | string | DID     |
| 1    | pubKey | bytes | 指定的公钥 |
| 2    | controller | string | 签名控制人 |

event:

event SetAuthKey(string indexed did, bytes pubKey);

#### 删除认证公钥

deactivateAuthKey

参数：

编号 |  名称 | 类型   | 说明
----|--------| ---|-------
 0  |  did | string  | DID
 1  | pubKey | bytes | 删除的公钥
 
 event:
 
 event DeactivateAuthKey(string indexed did, bytes pubKey); 

#### 删除认证公钥

deactivateAuthKeyByController

参数：

| 编号 |  名称 | 类型   | 说明       |
| ---- | ------ | --- |-------- |
| 0    | did | string | DID     |
| 1    | pubKey | bytes | 删除的公钥 |
| 2    | controller | string | 签名控制人 |

event:
 
event DeactivateAuthKey(string indexed did, bytes pubKey);

### 服务入口操作

#### 添加服务入口

addService

参数：

编号 |  名称 | 类型   | 说明
----|-------| ---|-------
 0  |  did | string  | DID
 1  |  serviceId | string  | 服务标识
 2  |  serviceType | string  | 服务类型
 3 | serviceEndpoint | string | endpoint
 
 event:
 
 event AddService(string indexed did, string serviceId, string serviceType, string serviceEndpoint);

#### 更新服务入口

updateService

参数：

编号 |  名称 | 类型   | 说明
----|--------| ---|-------
 0  |  did | string  | DID
 1  |  serviceId | string  | 服务标识
 2  |  serviceType | string  | 服务类型
 3 | serviceEndpoint | string | endpoint
 
 event:
 
 event UpdateService(string indexed did, string serviceId, string serviceType, string serviceEndpoint);

#### 删除服务入口

removeService

参数：

编号 |  名称 | 类型   | 说明
----|-------| ---|-------
 0  |  did | string  | DID
 1  |  serviceId | string  | 服务标识
 
 event:
 
 event RemoveService(string indexed did, string serviceId);

### Context操作

#### 添加自定义context

addContext

参数：

编号 |  名称 | 类型   | 说明
----|-------| ---|-------
 0  |  did | string  | DID
 1  | contexts | string[] | 添加的context列表

若列表中的某项context已在该DID中，则忽略该项。

event:

event AddContext(string indexed did, string context);

#### 移除自定义context

removeContext

参数：

编号 |  名称 | 类型   | 说明
----|-------| ---|-------
 0  |  did | string  | DID
 1  | contexts | string[] | 添加的context列表

若列表中的某项context不在该DID中，将被忽略。

event:

event RemoveContext(string indexed did, string context);

### 验证方法

#### 验证签名

verifySignature

参数：

编号 |  名称 | 类型   | 说明v
----|-------| ---|-------
 0  |  did | string  | DID

接口调用的交易需包含被验证的签名。

返回：True/False

#### 验证控制人签名

verifyController

参数：

编号 |  名称 | 类型   | 说明
----|--------|---|-------
 0  |  did | string | DID
 1  |  controller | string  | 签名控制人 

调用接口的交易需包含所有被验证的签名。

返回：True/False

### 查询接口

#### 查询DID Document(JSON)

>note: 此接口暂未实现

getDocumentJson

参数：

编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | did | string | 查询的DID

返回：DID对应的Document数据，该数据以JSON-LD方式组织。

DID Document具体内容可以查询[DID规范v2](https://)。

#### 查询DID Document

getDocument

参数：

编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | did | string | 查询的DID

返回：DID对应的Document数据。

#### 查询context

getContext

参数：

编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | did | string | 查询的DID

#### 查询public key列表

getAllPubKey

参数：

编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | did | string | 查询的DID


#### 查询authentication列表

getAllAuthKey

参数：

编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | did | string | 查询的DID


#### 查询controller列表

getAllController

参数：

编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | did | string | 查询的DID

返回值
编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | controllerList | string[] | 查询结果


#### 查询service列表

getAllService

参数：

编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | did | string | 查询的DID

返回值
编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | serviceList | string[] | 查询结果

#### 查询创建时间

getCreatedTime

参数：

编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | did | string | 查询的DID

返回值
编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | createTime | uint | 查询结果


#### 查询更新时间

getUpdatedTime

参数：

编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | did | string | 查询的DID

返回值
编号 | 名称 | 类型   | 说明
----|-----|----|-------
0  | updateTime | uint | 查询结果
