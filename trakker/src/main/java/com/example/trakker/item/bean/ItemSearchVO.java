package com.example.trakker.item.bean;

import com.example.trakker.common.PagingInfoVO;
import com.example.trakker.common.PagingInfoVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // @Data => getter,setter 등을 @Data 어노테이션 하나로 사용 (lombok)
@NoArgsConstructor
@AllArgsConstructor
public class ItemSearchVO extends PagingInfoVO {
    private long iidx = -2;
    private String title = "";
    private String content = "";
    private String author = "";
}

// lombok 이란?
// lombok 은 java 라이브러리로 반복되는 getter,setter,toString 등의 메서드 작성 코드를
// 줄여주는 코드 다이어트 라이브러리 입니다. 보통 Model 클래스나 Entity 같은 도메인 클래스 등에는
// 수 많은 멤버변수가 있고 이에 대응되는 getter와 setter 그리고 toString()메서드 그대로 때에 따라서는
// 멤버 변수에 따른 여러개의 생성자를 만들어주게 되는데, 거의 대부분 이클립스 같은 IDE의 힘만으로
// 생성한다고 하지만 이 역시도 번거로운 작업이 될 수 있다.
// 뿐만 아니라 코드 자체가 반복되는 메서드로 인해 매우 복잡해지게 된다.

// lombok은 여러가지 어노테이션을 제공하고 이를 기반으로 코드를 컴파일 과정에서 생성해 주는 방식으로
// 동작하는 라이브러리이다.
// 즉, 코딩 과정에서는 롬복과 관련된 어노테이션만 보이고 getter와 setter 메서드 등은 보이지 않지만
// 실제로 컴파일 된 결과물(.class)에는 콛3ㅡ가 생성되어 있다는 뜻이다.
