### Kubernetes YAML Object Reference
* * *
#### Basic informations
* * *
* `apiVersion`
apiVersion - 해당 object를 생성하는데 어떤 버전의 Kubernetes API를 사용할 것인지 명시.
* `kind`
어떤 종류의 리소스인지 명시. Deployment, Service, Secret 등 ...
* `metadata`
이 리소스의 각종 메타 데이타를 넣는데, 라벨이나 리소스의 이름등 각종 메타데이타를 넣는다. `name`은 현재 리소스의 이름이고, `labels`는 관련있는 앱끼리 묶을 수 있게 하기 위해 사용한다.
* `spec`
소스에 대한 상세한 스펙을 정의한다.
* * *
* Deployment의 상세 스펙 설명
	+ `replicas`
	설정 안하면 기본값 1
	+ `selector`
	Deployment가 관리할 파드를 찾는 방법을 정의한다. 여기서는 간단하게 파드 템플릿에 정의된 레이블(app: nginx)을 선택한다.
	+ `strategy`
	이전 파드를 새로운 파드로 대체하는 전략을 명시한다. `.spec.strategy.type` 은 "Recreate" 또는 "RollingUpdate"가 될 수 있다. "RollingUpdate"가 기본값이다.
		+ `Recreate` : 기존의 모든 pod는 새로운 pod가 생성되기 전에 죽는 것을 보장.
		+ `RollingUpdate` : `maxUnavailable`은 업데이트 프로세스 중에 사용할 수 없는 최대 파드의 수를 지정하는 선택적 필드. 기본값 25%. `maxSurge`는 의도한 파드의 수에 대해 생성할 수 있는 최대 파드의 수(또는 비율)를 지정. 기본값 25%
	+ `template`
	template 필드에는 다음 하위 필드가 포함되어있다. 
    `.metadata.labels` 필드를 사용해서 app: nginx 라는 레이블을 붙인다. Deployment에서는 템플릿 레이블 필수임.
    `.template.spec` 필드는 파드가 도커 허브의 `nginx:latest` 버전 이미지를 실행하는 nginx 컨테이너 1개를 실행하는 것을 나타낸다.
	    + `spec.containers`
	컨테이너를 가지고 있기 때문에, container 를 정의한다. 이름은 nginx로 하고 도커 이미지 nginx:latest 를 사용하고, `imagePullPolicy: Never`는 이미지가 로컬에 있다고 가정하고, 원격 저장소 같은곳에서 받아오지 않게 한다는 의미.

* * *
* Service의 상세 스펙 설명
	+ `metadata.annotaions`
		+ `metallb.universe.tf/address-pool: default`
		특정 pool 안에 있는 ip주소로 할당할 것을 요청.
		+ `metallb.universe.tf/allow-shared-ip: shared`
		이걸 true 로 해주고, 클러스터가 어떤 조건을 만족하면 서비스들이 모두 같은 IP를 공유하고, 포트만 다르게 해서 접근할 수 있다. 만약 그 IP를 특정 IP로 고정하고 싶다면 `spec.loadBalancerIP` 를 명시해주면 됨.
		자세한건 [여기](https://metallb.universe.tf/usage/#ip-address-sharing)
	+ `selector` : 서비스를 정의할 때 `selector.app: myapp` 인 애들끼리 묶어서 서비스한다.
	+ `ports`: 포트가 두 개 일땐 포트 이름을 명시해줘야함.
        - 포트는 TCP를 이용하되, 서비스는 80 포트로 서비스를 하되(`port: 80`), 서비스의 80 포트의 요청을 컨테이너의 9376 포트로 연결(`targetport: 9376`)해서 서비스를 제공한다.
